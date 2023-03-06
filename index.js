import mongoose from 'mongoose';
import fetch from 'node-fetch';
mongoose.connect('mongodb://127.0.0.1:27017/university-2023');
/*
const advisorSchema = new mongoose.Schema({
      s_ID: {type:String},
      i_ID: {type:String}
});

let advisor =new mongoose.model('advisor', advisorSchema);

let API = 'http://localhost:8000';

async function getdata() {
  const res = await fetch(API);
  const data = await res.json();
  console.log(data.advisor);
  try {
    let inserted = await advisor.insertMany(data.advisor);
    //console.log(inserted);
    process.exit(0);
  } catch (e) {
    console.log('Some error');
    console.log(e);
    process.exit(0);
  }
}

getdata();*/

const advisorSchema = new mongoose.Schema({
   s_ID: {type:String},
   i_ID: {type:String}
});
const classroomSchema = new mongoose.Schema({
building:{type:String},
room_number:{type:String},
capacity:{type:Number}
});
const courseSchema = new mongoose.Schema({
  course_id:{type:String},
  title:{type:String},
  dept_name:{type:String},
  credits:{type:Number}
  });
  const departmentSchema = new mongoose.Schema({
    dept_name:{type:String},
    building:{type:String},
    budget:{type:mongoose.Decimal128},
    });
  const instructorSchema = new mongoose.Schema({
    ID:{type:String},
    name:{type:String},
    dept_name:{type:String},
    salary:{type:mongoose.Decimal128}
    });

    const prereqSchema = new mongoose.Schema({
      course_id:{type:String},
      prereq_id:{type:String},
      });
    const sectionSchema = new mongoose.Schema({
      course_id:{type:String},
      sec_id:{type:String},
      semester:{type:String},
      year:{type:mongoose.Decimal128},
      building:{type:String},
      room_number:{type:String},
      time_slot_id:{type:String}
      });
      const studentSchema = new mongoose.Schema({
        ID:{type:String},
        name:{type:String},
        dept_name:{type:String},
        credits:{type:mongoose.Decimal128}
        });
      const takesSchema = new mongoose.Schema({
        course_id:{type:String},
        sec_id:{type:String},
        semester:{type:String},
        year:{type:mongoose.Decimal128},
        grade:{type:String}
        });
        const teachesSchema = new mongoose.Schema({
          ID:{type:String},
          course_id:{type:String},
          sec_id:{type:String},
          semester:{type:String},
          year:{type:mongoose.Decimal128}
          });

let advisor =new mongoose.model('advisor', advisorSchema);
let classroom =new mongoose.model('classroom', classroomSchema);
let course =new mongoose.model('course', courseSchema);
let department =new mongoose.model('department', departmentSchema);
let instructor =new mongoose.model('instructor', instructorSchema);
let prereq =new mongoose.model('prereq', prereqSchema);
let section =new mongoose.model('section', sectionSchema);
let student =new mongoose.model('student', studentSchema);
let takes =new mongoose.model('takes', takesSchema);
let teaches =new mongoose.model('teaches', teachesSchema);

let API = 'http://localhost:8000';

async function getdata() {
const res = await fetch(API);
const data = await res.json();
try {
 let inserted_a = await advisor.insertMany(data.advisor);
 let inserted_b = await classroom.insertMany(data.classroom);
 let inserted_c = await course.insertMany(data.course);
 let inserted_d = await department.insertMany(data.department);
 let inserted_e = await instructor.insertMany(data.instructor);
 let inserted_f = await prereq.insertMany(data.prereq);
 let inserted_g = await section.insertMany(data.section);
 let inserted_h = await student.insertMany(data.student);
 let inserted_i = await takes.insertMany(data.takes);
 let inserted_j = await teaches.insertMany(data.teaches);
 console.log(inserted_a);
 process.exit(0);
} catch (e) {
 console.log('Some error');
 console.log(e);
 process.exit(0);
}
}

getdata();