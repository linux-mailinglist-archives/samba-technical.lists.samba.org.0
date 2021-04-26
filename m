Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 932F336B260
	for <lists+samba-technical@lfdr.de>; Mon, 26 Apr 2021 13:33:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=XuqNk8Tc41Shn5+RnQJaO0zJ154BQ0Era8THDQMDuEk=; b=HHBOi/nyll7QBGRJCzgQ4HGXsF
	9RcTm8DRaDiwQ+aJ+2rGo7pAki7L25EFNTUm/benO5VLZ0P0iO7uQ9hroJwo6kZq205gFrpftjEnT
	aFov3S62ekhQai6OJulff6fE9via/Ep9Z75B2+al/JB66ijI7MPuLmeZfK7pA4PzwM+7021VIOjXs
	JRkP0yzcCewNkam/MomMsgrshPDFGPwzr1nEhTwqRClhEJwjGMzqyyoo35L5qlhfI3BjYA0LbA1cc
	P0BrWFoqQqmVA0XtcSBwgl6x/aT0Bmi0JN935cN8QeXiokfFhno9s+Ru6gyN4JOt9nGdr8XlhRUHu
	CxVfcY0Q==;
Received: from ip6-localhost ([::1]:51838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lazU9-00CTTl-OM; Mon, 26 Apr 2021 11:33:05 +0000
Received: from sonic316-13.consmr.mail.bf2.yahoo.com ([74.6.130.123]:33228) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lazU4-00CTTc-PM
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 11:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1619436765; bh=XuqNk8Tc41Shn5+RnQJaO0zJ154BQ0Era8THDQMDuEk=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=sDFmqpByJPWTxI/ppuWbMjlaOUwlG+p+Z6g6riytAg1HHPtBF4+L7BcOv3ShP8p3UEuQBng4JMsNHrpf/qadIIuWXYKmlYTJX9KX7Y84YFeeQODKLPDfyQ8HN4NW8NO7l636WTqSitf7m0rbMJGYSX1UoBY5gx/kOjSTkoDQFPH6pZepUklBAFnt0i9p9UaunnwV3nghAjcSAhYKodWJchbyQFWm2qY4k+A7R1ehTnF5MnPOg9XAwnad6TEl2NjowQzG9YwL17Elv+K1/D9EBSBwtk47IuBetBSnVMEZogC4qouJ2sXy2or9BlX6SEeGPjb7gwmRWlEmjiqsjV67Mg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1619436765; bh=nF+MzJ3uBWZ6+2fTi8mMCAULYxT+5e4gj9jLkfLNn8e=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=YJ6oa6BG7CU50VBG8t99KfKZvUgd7tUP0as4tKfb7FHusXMLW9W4bhkMEloPUgDuaYg1AX7xd5TvXsCtKHfeCxrmWVqve2bjfZdkA5ECJHxN9DxvHPBRIisbmbdYFBDq8DuGBEt4p5m7HUZ2P9cA3P1AKFQaYb7bArKBjO/5wC/YJ4jQaDdLlCL7wlgYwdkPsUNuGcamEpEeDmI3ExN6PBgHzhLyfAEZq2htiuHbMdwc/d3pSS0ukvO96wNC21IivGrsaKDZd0UYGHzkITIDrb5ECtIK5mA0x6slvcLdV/aSV0KrtDg2Kbg0NKH2iRJr1KoJpIMcO29/F+PTWv9lnA==
X-YMail-OSG: rvfR6OUVM1k6EyAdbgWTyEXdbkx6z608XMb9DNAWrMPatVIVXu5MfJSWSP.6j2R
 CFD7EHptgR6CtMwQoaHjpbcD.jyYhkJt.5PNgbsUwa9ZFrxePlSKdnDumCnuIO7dioJo5Aqk.7VA
 SIHD5qbiNZ1DNZ1ddrte8E9A1SxsFmYBusQhDNf8gD6m_7NrE9rXIV8ThLvykNNjwPOp7xlUUtZV
 wyPVznD.A7EZIkL_kA7oK5c.PyUfmV7.HUcVJmIAx8d9prs6Q.I9W..hy5HhXIrZpM3IRyPZyRw4
 m4lIQRAQ9tEARecz69OPcVykH3ORIUXLuD7PxVuZKpJ91Ix8WM0p5um8GS3YukGJM6ux.Rg0qEOK
 N4PoMgp.KBLZ1ktUH2M3IPqiPYYsl_.w8HVq89y6CvlJND2v4lakIvIMFKsi3QOQf0NdFV8TyhUC
 6KuTwciW7kh3J1e5.iJ2yf2NAOGcKOg0i15jIoMjiIl_cN.EiYEDy7bmpASmmjc6AT5eB9C5IagW
 qT8emp7A9UFbHQx3LHBlvP1eHddoi9xcHqRDfXEdceEYyxEDVpd2kQ6knYhvLLaTSIRLJgqhFbjX
 Y2SQ0y8I942LiG7vA8j6bZeufLAPmqvSkKnccXzBP52OsfLTeLH0XC1MniWCN0woxn_a3VRQYj94
 i5YsQIynkEKPqCGo_6T4Y5FoZcMJovWglaMKVW47emsyxPWMFqA1AlimFHubdz077Sg_ALMNIfyS
 zK_MkZqYV8qlHlYEKa0Y_oof1hMAh5deWgWWVCG1UMsDJyZqkGDus6_i2qMUcZxf53IqDWaNbkmi
 Lr2wiBYNwlBqVfyPk.VaivjvBRr6CkppA2Bvx0kYtJZk9hLN379dgVR_RXBF1Nfo3VWp3OyPu5cl
 _jGOq42u0v.kby85J.tLOv1zmCZtTU.7RjVAHExIZupbpSZDyOyO_jJmq51mMnmaO.USS1VQQBFb
 oCwt6QJuUBKGOr5HcCDRNFpmlNt4yDiGQMY4JAod0eaJXs_.imlPOfTiWkPDJcMX23ToiDT57vWn
 dKOjE5TWx86CQi46X.7QCnjGQLZS_Wyw76Pf5L8VNv1aSHxSlFPzHMREcB.X5oEDfH.9wiW5G_1T
 jXMe7Vi..BFBLsQL8S3nFaqcbRXbnrXQyRcrVdhMKng.iNLUD1zhiCmm2tv4rUgyN4bV2cUqc7A8
 iPlr9L7tJRmrSRS2qxqJUnsDQTopicid_BP5GATmbE_HhamxgP01lDif96vMOGmY9Ggn0xi.Af8Y
 IKbVUXQQ3Prz_FKyOYznhlc5KqMBCLVgfrqnCoTHA8LwlsHLsiOlR82wMl2NHuUw00E6z3LFiDfj
 G185WtPjaS7Y4e2o_L8QUU0RomM0RuIZuQk8rwq98uzzOuocLYglRFKVmHOyZrahlhARZuRMUi1g
 EOr.pjBUd_y2IpvYsdeAj_uUaSSDy3Sr6cbBar8gMzC7PMfNpkB4RZAxKSFUDJRACh2dwStTYvaG
 QumpS5Yh9hx..4G8NzDephVeY1QUK9cR9YtLXVBwjx4ybdK9nmNRHaoLSKWDPyOrG1eJOOzc3rcR
 Zw9U0n9OAE4J_3kAH50q4dFFs2A6OLWzj1p3h0eV0PlfKxfxw5xtUJk62BTHvCs58Uo_4tCUI8iS
 fVpYX2ZAdkkngq9aGcIrC8cLVzitDEOTq78wE3X_uvVK0AjQCS5MKAQVLA4QpcYVllUHr.2g2BiN
 cv2icmXoG0pWAjhAEpLLyNTo7IGrrt8TZiDRye.mbwCDvH6fD7n0eixWyIvIB0fYk8vUf7Yw8C01
 ZJwmDQtAl6L8l.fftx9vvLSKhaL9QkdUbS412ez4FiudRCHc5qm3StBisXZb4QPdPFTLjC5qnAVO
 h_j4pjESAQ0CUAgYCdZqL79EdRxyA9w1UdyjxEUoGODSCYGVz6DHihfSrOKuJj1l427lcjYFeV4u
 HmfrQ4lpq28DBtuxLrSfRPBSiFtYiQaOXiW5ZUISrlSzOh4uUDjxaJ8dWZdG2.Q0CTq3MhmPQLlR
 sK7JmkWGj90A4vTIy.hPKjoD1tkNUX2PBUbXzgZ8RwJY7C7uKEICPeiWX3xp8oGz4VUY4N05NVkx
 1Id47OUsJkmgaskEDTjEqmR8_wRsvC5eRKlF5CTEIv3_a83lh4x9xH26pRT5_KQS5iMb0IPpxhaL
 A0NqxL7msFtcoFuciEDdA1FV02PZfmfdQIVf0o2Iy_UNKa72LHm8holue3uNdsTcSMprSnkR2Yl3
 747Tmf1N8fYWLZsK61uvoWg33sAAJ4TnbGhQb7.whsS18Hbzj86wQU5GSL834DTUQ2Z_he.YdpH5
 4DisDXh3zDoiudU02OkO1s6BdszJlkpbhy80g7SGyn_E8C7_W87QqOM.s5xzxgBwLRJOEcnc64l6
 nLl664XBBrY24Su5EMRC3iweh5EqS4IQYGfruNsafCszOgwMuwloAcoLQ97mrAMbx
X-Sonic-MF: <hack3rcon@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.bf2.yahoo.com with HTTP; Mon, 26 Apr 2021 11:32:45 +0000
Date: Mon, 26 Apr 2021 11:32:45 +0000 (UTC)
To: Samba-technical <samba-technical@lists.samba.org>
Message-ID: <1398593433.332041.1619436765261@mail.yahoo.com>
Subject: vfs_snapper is enabled but prerequisite dbus-1 package not found.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1398593433.332041.1619436765261.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.18138 YMailNorrin Mozilla/5.0 (X11;
 Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko)
 Chrome/90.0.4430.85 Safari/537.36
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Jason Long via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jason Long <hack3rcon@yahoo.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,
I want to install the last version of Samba as a DC on Fedora Server. I did=
 "./configure" and got below error:

vfs_snapper is enabled but prerequisite dbus-1 package not found. Use --wit=
h-shared-modules=3D'!vfs_snapper' to disable vfs_snapper support.

I checked the=C2=A0dbus package and it installed already:

# yum install dbus
Last metadata expiration check: 0:12:35 ago on Mon 26 Apr 2021 03:43:20 PM =
+0430.
Package dbus-1:1.12.20-2.fc33.x86_64 is already installed.
Dependencies resolved.
Nothing to do.
Complete!

How to solve this error?

Thank you.

