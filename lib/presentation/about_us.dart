import 'package:flutter/material.dart';
import 'package:testapp/static/colors.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColors.white.withOpacity(0.9),
      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Text("INTRODUCTION",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: myColors.darkgreen)),
            const SizedBox(
              height: 8,
            ),
            Text(
                "➼ Santi Overseas Pvt. Ltd, established under the Company Act 2053 of Nepal Government with Registration No. 176847/074/075, and Department of Foreign Employment. Government of Nepal with License No. 1495/074/075, is one of the leading manpower recruitment agencies in Nepal operated by a team of experts in the field of recruitment services. Within the short period of time, the company has gained vast experience enabling it to be one of the reputed companies in the country, and it has owned remarkable achievement  ensuring the total satisfaction of many renewed companies and organizations inside the country and overseas as well. \n➼ Santi Overseas Pvt. Ltd. has dispatched many professionals (skilled, semi- skilled and unskilled) from Nepal to Malaysia. (UAE, Qatar, Kuwait, Oman, Bahrain, Saudi Arabia and many more countries.) The highly qualified professionalism of the company makes the clients get maximum output at minimum cost and effort. Since we have never failed our clients in the past and will make it equally easy for them in future, they can fully rely on us.  We compete in the employment service industry by offering a complete range of recruitment services with in the framework of the business ethics.\n➼ The reason why Santi Overseas has retained some of its clients gained at the beginning of its operations is the philosphy to view its manpower as a partnership and a bridge to build a lasting relationship with them. At the core, Santi Overseas's philosophy is its commitment to provide Top Quality Recruitment Solutions. We always aim to exceed client's expectations as we view every recruitment undertaking as a long-term partnership born out of trust, competency and service satisfaction. Many of our existing clients have enjoyed the benefits of our professionalism and integrity which has enabled us to search and sign up top-quality workers from some of the world's well-known and established companies and industries, and career of candidates we have considered and deployed. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                    color: myColors.darkgreen)),
            const SizedBox(
              height: 32,
            ),
            Text("VISION",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: myColors.darkgreen)),
            const SizedBox(
              height: 8,
            ),
            Text(
                "➼ To be the best worldwide provider of high-value staffing services and the center for quality employment opportunities. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                    color: myColors.darkgreen)),
            const SizedBox(
              height: 32,
            ),
            Text("MISSION",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: myColors.darkgreen)),
            const SizedBox(
              height: 8,
            ),
            Text(
                "➼ To provide distinctive services to our clients and maintain legal practices.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                    color: myColors.darkgreen)),
            const SizedBox(
              height: 2,
            ),
            Text(
                "➼ To meet the expectation of our clients and applicants through optimum utilization of our available manpower resources. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                    color: myColors.darkgreen)),
            const SizedBox(
              height: 2,
            ),
            Text(
                "➼ To be a benchmark model in the application of quality management in the manpower industry in Nepal.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                    color: myColors.darkgreen)),
            const SizedBox(
              height: 32,
            ),
            Text("FOCUS",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: myColors.darkgreen)),
            const SizedBox(
              height: 8,
            ),
            Text(
                "➼ To provide a highly resourceful and dynamic exchange between opportunity seekers and employers.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                    color: myColors.darkgreen)),
            const SizedBox(
              height: 2,
            ),
            Text(
                "➼ To provide the World's most complete End-to-End solution to our clients through well-defined systems, process and strategic initiatives.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                    color: myColors.darkgreen)),
            const SizedBox(
              height: 2,
            ),
            Text(
                "➼ To provide best possible support in searching the right kind of   candidates by strictly adhering to the policy.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                    color: myColors.darkgreen)),
            const SizedBox(
              height: 2,
            ),
            Text(
                "➼ To cover entirely the leading sectors like Engineering, Maintenance, Constructions, Manufacturing, Service, Security, Hospitality etc.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                    color: myColors.darkgreen)),
            const SizedBox(
              height: 2,
            ),
            Text(
                "➼ To support the empowerment of overseas workers through educational awareness and direct involvement.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                    color: myColors.darkgreen)),
          ],
        ),
      ),
    );
  }
}
