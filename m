Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D50CCF37
	for <lists+samba-technical@lfdr.de>; Sun,  6 Oct 2019 09:46:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=laoGjAbNF5lm6ANK7dq5cnEZtqZ/trAe6zrRNlOszRA=; b=Jc/bhdp8FPtkAD3HtrCh3r6096
	R5hcLYmMnV8/OaewHOjBeEQE43Iq19otxuB5C087vFM0AKF3gIArvTey+rqWHUNYKD1bLRYyoAGU5
	Mj43BXgAmSerM3aRJq6cxfQHGapa7tVfDUotKqM1bkhOMIVKYh0yCLFQBrI6Ai6TyhsV3xPTPcpWT
	ncNo3F5vP73dlps16yUYd+VDrMjT5kxdq7iME8h4vBx9ihf66HOUI6vJsEGGV7qX1XJe9dKWAApGp
	DMRPTzdxK6bzJh6mZCCIiK4wX7vpHYbNIuEuLVgKTdTxfIglseLB8dYugdxxwQuHO1yr7RNPwITTj
	6+jj2h+g==;
Received: from localhost ([::1]:49096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iH1Eb-001Zhi-9m; Sun, 06 Oct 2019 07:45:41 +0000
Received: from mout.gmx.net ([212.227.15.19]:47921) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iH1EV-001Zha-6k
 for samba-technical@lists.samba.org; Sun, 06 Oct 2019 07:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1570347932;
 bh=laoGjAbNF5lm6ANK7dq5cnEZtqZ/trAe6zrRNlOszRA=;
 h=X-UI-Sender-Class:From:Subject:Date:To;
 b=gcwBxcR3biV6YDz2zv66YWKi9164VMvQFCorLD9nuNiKWsqTLkDHGHEOxKYc+jiJS
 4z+dC8Ju3jxjSK3enpPgywfGEk+5EdnJvNmo8mis+ltnQW5lsFT7/GSkmbZF79cJjx
 FXKe8O7JF73klb2W82SPiH0kVIUlEdiJJisfhd+Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from macbookpro.local ([91.66.148.27]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJE2D-1iWkZ50Afr-00KdSG for
 <samba-technical@lists.samba.org>; Sun, 06 Oct 2019 09:45:32 +0200
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: pam headers not found by waf on illumos/openindiana 
Message-Id: <C90A30A7-3FE6-449D-92D6-BB37D9E986DC@gmx.net>
Date: Sun, 6 Oct 2019 09:45:31 +0200
To: samba-technical <samba-technical@lists.samba.org>
X-Mailer: Apple Mail (2.3445.104.11)
X-Provags-ID: V03:K1:EbKXTuzVSUFKKnUfLvpVJ6Om0vVCHuW9ZSHHmZXBzhgboJpnEqV
 E6D1I91g/4cs/UNANSvJRiMxynxkaMDDdMSAUWYEUtvkQirb5O0ImlEH16R33emLTYXAu75
 SqdOWrQtY86YBbJr6GzxRCQB6Kc1EY0QC43rwK8vBn4AhInAqxBn6LhQiNw5S5xzF3Jtudm
 0409PcbqdnrftzRmw0pPA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HGdhFmE4AZc=:Hmi4eJxAHNMw0XNYmnpEgv
 cbwnZn4CwvnLgz3cKeMoX/UgiyADQ2YHPMIpsabi4sUYjfgVtWPI9F+oTbiZtXjAz95A5iSj+
 +EXKKeQMBZQtNg8FthA77LUxppZohjyaBRHkBoynjF4A6NuHFUUazcYLLbC6tRMAiNXGvn+F5
 hoAlMCWuFpVHMORaLSC5IC50i0T4+Wy7UdeOb90Ep2GOIiwfbkRqGIaDeh6s+3IkHkOdnHkPd
 kjPnR1NtddlR4cLzXpi9y4If7jai3rJ4z/kAHOPlL/vEEBOi8DoZ4RiFcr7Z/9fMrqI1YWMfw
 dLsFLO3QvgSJv4Fw3qDjLkTEZ5ZGJkqgP2XKPmyYAJDML7V9nmsTD+oWPzTkVclmsUSAfWO48
 W4KLS3eiNtWWL0qcyQMAOb02jioSZty2e/YA8i7tvUxMHu45QXWB2tvKuIBUoNspQ3YY/+LC6
 3c7jMvGheKEX7M33xop7LVLK1jZJkI2cwr+0+FgJ4jxDZwd0RO3wKLQWAHSP20oZof+CBiFcM
 iAV84yetAc33eJWRPKlaV1i7JWxPo2S+vqhja3eB99NAlKBmanNT9WW1fCFzA9q7LE316gjTO
 znPRYj8TsINu4jqVvSyLcKRqcuN168OPjjA+Ugl3DzKMkE/CpTE/lceMx023Jo3vryMVvAj3H
 2GmDelkeBBlWDR/0r6xiV0wXlQC7m3Yzu6jt5LD2F7vE1hdGyzCYZ29xZbQ5W6glYlSiSRWsN
 JL9Ntupzguc4dP3Af+cS8D9GIIfMxOo0XUFOr+d44QupPoii3PsnppNisFu9fiHCKf6/v35z0
 GkKJtFvzspqTRZGFTYbJj5nK6NqufAVlgVmlhrTsAPGx3Yd0GfGg3KpDt/rbyhklf7xyrTjKI
 os4p31Jsf2k3W6vFrj4/Mus9jkA1/+kqPoPKieGkyaagxNproQg9EXCYajycopTQC79FAX5fo
 UvucJe+P0DFhRsZ6jXTjejm7nmWbGfnFwsqLYFQu4h8d/X2YoI4d1vNmG2u2er2+jZBst8ncZ
 O377e0F7WvlVgF3ctU51UfOCQrTfft+fOJ/YjrXh0lZcwfOURndIg4hxaW87rdFoW8+ng+uyv
 5/6g+ZsymtiJn+9fVL+WPTH0u+A7BHgY7LCriCeCFFL3+Ge9ocKdjnZTQa7LnhHBUy4mB9glA
 QQmHOVimO1I4M1ITYbEWKGjQu1IcdO6xf4gIl3iGTmxscOQj54dqw1kwn6D5PcOFbovxt+iRV
 j7iAb42DcBuXj4biZ9oRyUfONaUz+SK27V1KtrGYmodmQJm6n0t3joQLHhKo=
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
From: Rouven WEILER via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rouven WEILER <Rouven_Weiler@gmx.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I am trying to compile samba 4.11 on openindiana/illumos.

I compiled it with =E2=80=9E=E2=80=94enable-selftes=E2=80=9C which =
throws the error, that I should use =E2=80=94with-pam=3Dno.
The reason is that the =E2=80=9Esecurity/pam_modules.h=E2=80=9C header =
is not found, BUT it is available as =
"/usr/include/security/pam_modules.h=E2=80=9C.

Compiling =E2=80=9E=E2=80=94with-pam=3Dno=E2=80=9C works of course.

Compiling without =E2=80=9E--enable-selftest=E2=80=9C also works, BUT =
automatically pam is left out since the "security/pam_modules.h=E2=80=9C =
is also not found although there (see above).

How can I tell waf to find the headers correctly?

Thanks in advance.=

