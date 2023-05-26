from flask import Flask, render_template, request, redirect
import mysql.connector

app = Flask(__name__)

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password ="hejhej123",
    database = "dv1663"
)

#Global Variables
s_id = None
c_id = None
nor = None
test = 0
course_name1 = None

#Login
@app.route("/", methods=['GET','POST']) 
def login():
    global s_id
    if request.method == 'POST':

        search_data = request.form
        s_id = search_data['studentId']
        cur = mydb.cursor(buffered=True)
        sql_select_query = """select *from Students where S_ID = %s"""
        cur.execute(sql_select_query,(s_id,))
        result = cur.fetchone()
        cur.close()

        if result:
            return redirect("/home")
        else:
            error_message = "Invalid student ID. Please try again."
            return render_template('login.html', error_message=error_message)

    return render_template('login.html')

#Homepage
@app.route("/home", methods=['GET', 'POST'])
def home():
    global c_id, course_name1
    if request.method == 'POST':
            
        search_data = request.form
        c_id = search_data['course']
        cur = mydb.cursor(buffered=True)
        sql_select_query = """SELECT * FROM courses WHERE C_ID = %s"""
        cur.execute(sql_select_query, (c_id,))
        course_name1 = cur.fetchone()[1]
        cur.close()

        return redirect('/course')


    return render_template('home.html')

#Course
@app.route("/course/", methods=['GET', 'POST'])
def course():
    global nor, c_id, test, course_name1
    if request.method == 'POST':
        if request.form["aplly"] == 'Apply':
            cur = mydb.cursor()
            result_args = cur.callproc('Student_Attend_Check', args=(s_id, c_id, None))
            result = result_args[-1]
            result_args = cur.callproc('Check_Points', args=(s_id, c_id, None))
            result_points = result_args[-1] 
            if result == 0 and result_points == 1:
                cur.execute("SELECT count_rows()")
                nor = cur.fetchone()[0] + 1
                cur.execute("SELECT S_ID, F_Name, L_Name FROM Students WHERE S_ID = %s", (s_id,))
                student_data = cur.fetchone()
                cur.execute("SELECT CourseName FROM Courses WHERE C_ID = %s", (c_id,))
                course_name = cur.fetchone()[0]
                sql_insert_query = """
                    INSERT INTO Attendings (A_ID, S_ID, F_Name, L_Name, C_ID, CourseName)
                    VALUES (%s, %s, %s, %s, %s, %s)
                """
                insert_values = (nor, student_data[0], student_data[1], student_data[2], c_id, course_name)
                cur.execute(sql_insert_query, insert_values)
                mydb.commit()
            
                return redirect("/home")
            
            if result == 1:                
                print("You are already attending this course")
                return redirect("/home")
            
            if result_points == 0:                
                print("You are not eligable for this course")
                return redirect("/home")
        
        elif request.form["aplly"] == 'DropOut':
            cur = mydb.cursor(buffered=True)
            result_args = cur.callproc('Student_Attend_Check', args=(s_id, c_id, None))
            result = result_args[-1] 
            if result > 0:
                cur.execute("DELETE FROM Attendings WHERE C_ID =%s AND S_ID =%s", (c_id,s_id))   
                cur.execute("UPDATE Attendings SET A_ID = A_ID - 1")              
                mydb.commit()
                cur.close()
                print("You have succefully dropped out of the class")
                return redirect("/home")
        
    return render_template('course.html', course_name=course_name1)

#Current Courses
@app.route("/current/", methods=['GET', 'POST'])
def showall():
    #SQL JOIN and 2 tables
    cur = mydb.cursor(buffered=True)
    sql_select_query = """SELECT courses.CourseName FROM courses
                             INNER JOIN attendings ON courses.C_ID = attendings.C_ID
                             WHERE attendings.S_ID = %s"""
    cur.execute(sql_select_query, (s_id,))
    course_names = [row[0] for row in cur.fetchall()]
    cur.close()

    return render_template('current.html', course_names=course_names)

#Scoreboard   
@app.route("/scoreboard/", methods=['GET', 'POST'])
def scoreboard():
    cur = mydb.cursor(buffered=True)
    #Aggregration and/or Grouping
    sql_select_query = """
        SELECT S_ID, F_Name, L_Name, Cur_Points
        FROM Students
        WHERE Cur_Points = (
            SELECT MAX(Cur_Points) FROM Students
        )
    """
    cur.execute(sql_select_query)
    student_data = cur.fetchall()
    cur.close()

    return render_template('scoreboard.html', student_data=student_data)

#Start the app, declaring the local host as the host
if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)