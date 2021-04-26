Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F1736B37C
	for <lists+samba-technical@lfdr.de>; Mon, 26 Apr 2021 14:50:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=OP34VLfTJZ8E/SjPun7drTJcYRwiFQLPEU5R7/DiXmw=; b=bRSGirp9QlH0eopvInu5Dt2/O6
	fEbZGhQByt3sBANIaa/ezvIJ7czb/076345afOrsRsV20qRJdmwhEQxOcZl+KTxjs0EOOqMqA81kY
	8PhbWwuX3uxdo7hy5KlRDeCF7nkj4LbnSYGXRJceTx8PiOSz08vMzX5IwG6J4Mkv1TpCjHFZpUEiF
	0YKxuaIISN6Zabn5Nn5DCmJiNYbACHKiAaFy/5bv5xuDBFK5xgd7KzZc+tfDZVkfFIAGAOom53RAZ
	8cNWBDJ5TIAhGlGY3omw8cutAXOsPP1E/C91pg8J/e76ZaEzgf3ubd5CiEn1O7jc+nvG0GMHv4ip6
	44BPqetQ==;
Received: from ip6-localhost ([::1]:55284 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lb0gO-00CUFn-9k; Mon, 26 Apr 2021 12:49:48 +0000
Received: from sonic310-13.consmr.mail.bf2.yahoo.com ([74.6.135.123]:35651) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lb0gG-00CUFf-AX
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 12:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1619441359; bh=OP34VLfTJZ8E/SjPun7drTJcYRwiFQLPEU5R7/DiXmw=;
 h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=itLBjHHDEQo3DynX0QAZdAZg1oQ5MY7JvhCetC4AivwPcB0ge3jaAMHXNdUNnOW5C4KKvlgAIR6703e4FSIXx3xVbC4x44Pto+No8zh1ef0KAji14a/fk003fs6ziawMAPBSY2OphhdP0BoGg/gQ7z9qO8hvk3M+3rf82nzUJO2ZhPYpLlNPx/XcRkrRppNTsKV73dxllh3PV/QQSJznVH+mDHmcE5uk/jhaRpk4a98ZOyI+6cBk7+H5hWqJFYPUR5PD24CagcGjuSi2PlFRkt+bzoyI1rv2mSnLadIbHXW+W4BK8rglVig371pPSQsXo7wBt4jqat+AgfENyM+Jiw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1619441359; bh=ytoxuaNMdn1YZOb1QjD338YasIzSqfqLaNCM7OVh+AU=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=Jbs/hCEuSMFXCuwsFL4dmrtTRV+yMPSnMXo0op9dnnZ/DpxMCO1Ahm2mo3P2ncwSHyGNyNk9QPLYhiugtzwbEGN2YokoS//bI6Nay/vsJZ551j1KhjqwU+sQZ5nsPqQPROu2AIXr8wJsKc2fHSH82lRDLKMXO7F6GCEDuWTLUrtM77BVc9uPdKFpj18xumX+bcMuPzGgTWg1SplfMBgiLEQajBqxuBz9zzpe9EGGpTzUfzsqCKbG8Sbvxu0zv8DNtWZYMJp+JrbsjDTsJehbMcNRshCratDZ0h/4vhHjp3SOY9VIcxOxVKvpX4PwI3+kdFLi0CZH5YtJhcGuXnb8hg==
X-YMail-OSG: x6MnqKcVM1lYmlcpkakYMB93jcV.g9LcfMg1AMxCnj8XTGuJz8PuK27tTDmHpLn
 QeUZSr25RWBE9aZHhYwYW47jSM3CAhs_f9wy08HOTRVK4JiH9wBvo2ASITCbaf0rvqBQn4yJITC.
 vgO2vHPbRpZWRTvW5mRgRYNXvF4M62EaDTMj6UwYhbs7fAnfCH.5fQ.KwAIWBBy.qa7.fktJ_QHq
 nm6TbhQMwBQIWwrE_6mJ_uwZDl042.Sp8S2qjHF5KljyJdPQ.67EUpUt8CCZQN0T1aidblzlvTsl
 l6.OdD_uXEbkwgrYoUzqB6taf.wL1z6ywb0Q1rEApU3i6opBBL6ES4MaZNiL06gcXhzF8lPh9VjF
 bokByKi0zhBPFPKnotaPZ9rQ1fZLui0iPRvSLsNMeBwmtDpVhIk.WFTY0VDJvtj2FqATOFi4J3mM
 D9RqdP8xX5TtFh_18bJsTzZLsBMHPVp0H5DsFC8_5y5MyElyqgaqUGqUDQ7q5nHfI8mg7JUCzQtZ
 HaddRjEtn.1kbodTreVt6KRCeEraN0eNvVN1dE_tyGOq0oW_NzxulY8Jrth_AwoHvUfKW3JVAozF
 xsOMWYE19J1.QSx_gUjJlgfJgjuwV9UgzVHB_Z5TQxdYVhCUpWK1TsM2gZ923dC6DlWAeDLZV_C0
 Jz94be_NDcLUmAaMOX_EjPZsBAz8Hx.f0z55KXM3RziLR9l6dvp6ssbPpzsAzwY.1o.ZisNoeZ6z
 opbp0bDNs2W71WTdAJk1d5Zw4zH.O3_oLIq00hC4PF2zAFKW_NxYfLw669dE6kVQ.U5lYvO3O29N
 4PUZbUyGtMppR_obK.3BIQ.IIeeybMuGV4o5d8W6ggsvWs_N6torvrqr7nem0odCn_RVfs8VQFeY
 Sk9qrXOreGaBQLRpSSYmfxnF5.YL2VXv5e_RBkLmgyO.TOoC8y9oi2UpD9emIfDcBNEQzXAP_VCc
 mzBBE5LxLoyxy_NGP2kHjc5NxamgaOu7I4l6KQ1v41femtg84E2z2ay3MS9qmLARw0.KF2Cr0PN7
 GhHHSrU93RaTlIbrkEjwwKFAxmcC0R_4OAsyKmpGdOLHm65zYb6zsY5Uscdsju0_S9g93mHec93M
 OJmYLUW1Qty.FYb.5Lf_gQCIEEP22AAFYjpUkUYjNUKOL_hPJclomlrh0M.XOInHXD3GaU.24EJ2
 tARV_sqJqFG5Q2yHYahIhXrlfpTBNyupBqMowRWIQoqFke1aEBATH3a.3tGajYKqMSA2ER7e8luI
 AsgucF47dTfVajp4AjiZILf0cmSFZP.xeswU28foygevtlr.sLGFAQ8G.8pirWpSxy7QYI8AhdqN
 HzkMFB2pTVAddz_jqyzctGU9Fn4joySCZw6pX_2qeVmwrZDbkP9t7MIIBDXasXSVynX50viqEj9j
 BqnKAYyAcRZBwGBm3r38kObGsQA6pMnrQyjbodkW5GFHEH8Rt1rlrLi8q_QdugRgIUDsCA0.vPG4
 EZCc2Y3rFQHP7_ZhJxnq2ieMcRyP5lsjup8eY3X00G_QFpGsJ1yHz.YlR.HwhSbuiPzalUBk9xBp
 kiEyhh8DTMAfOM7riL3wyitqc7U7XKqzYkrakDZWb_rJ4K51tq5j0xMihBf.C4YHcPoL7mvYjVT5
 hp3Ney6q0fdjgDW3PATfmdV6jaUx5al2TnaKcC9BhBXhZDQv9cNuiEYEtpA6QYxbSPCIsjxxFMx.
 g5VtSktWMmxWOikRKoNnHIwiEuLrqGp1OOEITGVrTeSBbmu_are4k0Lg62CsiE9UdI80Y6y9n2BY
 XPQuY9OL0XVBglmV3x8LfF0QxV0jr4GSWQndfSLn9L01fkDsmdWB6Ci8AA6QVd41oNfDaHW5qJxu
 62F6L1pejI5F5QF7mhJsnMqEO9wkutuEtMCNYe0iDzp29MQm1XkFfnPL3IirDJh9DqK5l1lfve44
 fQSzzDjMSF4vYIAL.DW1zpAh90qO6nIMySZIqTgXGx8WK64Pnk8NqgRVteLfHpRLrR8dCxp_pPOB
 jouaUXBhnkL8y.Kj4eRpmHeNdaAk6N_AHIfM2MJjtEtlo1t2TkSEJhU3yAlREPFczCdDzdGyaKxx
 2nUPWmWMiLUm7HksMyYmOLRNp2g73CFunhq4Th3qJQsVaPzJwTU6bhrseG7Ew0W5kvwED8nf7IaD
 w69I.3zsn6GswQtVU80pnaKHdKBz0qVHGeoq6_C9U5p4wW1HhGMgSD_KPQjhe4LeDLMumQmSABFK
 9ssJbMgZ3DDWEa8sYx0aCPaAY5zJCKomNpU6GtzCRqC4U37.K3PDwdhUnp3LCQyTfRqPjrNI3L.O
 7uQK8qKjBjGgfDpfm_AVwg.tmd1yw.Tbp2gESfXinplPpkKTT1GnM_I2v5KAE_nxCm7YeDAISNvQ
 QUN.q_8S9M1BsE3GxuN03zr6eAzH9ZLM2NDllJiuP5ANaTeJATsRRy_s6GVOx8C5ewQZPX4cFkuu
 Tot6CGMkmvmc1BzCHdjrryD4q_loASjnqBgXi_Ygt1DHjgBLVD1f2TuHXu4Q8H_vuHFL3hieX3fA
 D1Xk1PcZLIRvxIYaSqQ--
X-Sonic-MF: <hack3rcon@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.bf2.yahoo.com with HTTP; Mon, 26 Apr 2021 12:49:19 +0000
Date: Mon, 26 Apr 2021 12:49:18 +0000 (UTC)
To: Jason Long via samba-technical <samba-technical@lists.samba.org>, 
 David Disseldorp <ddiss@samba.org>
Message-ID: <366648288.356507.1619441358566@mail.yahoo.com>
In-Reply-To: <20210426140050.26e7bcfd@samba.org>
References: <1398593433.332041.1619436765261.ref@mail.yahoo.com>
 <1398593433.332041.1619436765261@mail.yahoo.com>
 <20210426140050.26e7bcfd@samba.org>
Subject: Re: vfs_snapper is enabled but prerequisite dbus-1 package not found.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Thank you.






On Monday, April 26, 2021, 04:31:35 PM GMT+4:30, David Disseldorp via samba=
-technical <samba-technical@lists.samba.org> wrote:=20





Hi Jason,

On Mon, 26 Apr 2021 11:32:45 +0000 (UTC), Jason Long via samba-technical wr=
ote:

> Hello,
> I want to install the last version of Samba as a DC on Fedora Server. I d=
id "./configure" and got below error:
>=20
> vfs_snapper is enabled but prerequisite dbus-1 package not found. Use --w=
ith-shared-modules=3D'!vfs_snapper' to disable vfs_snapper support.
>=20
> I checked the=C2=A0dbus package and it installed already:
>=20
> # yum install dbus
> Last metadata expiration check: 0:12:35 ago on Mon 26 Apr 2021 03:43:20 P=
M +0430.
> Package dbus-1:1.12.20-2.fc33.x86_64 is already installed.
> Dependencies resolved.
> Nothing to do.


When building with vfs_snapper enabled, Samba requires the development
header files. They should be present on Fedora in a dbus-1-devel or
dbus-devel package.

Cheers, David



