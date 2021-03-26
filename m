Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCDF34AB82
	for <lists+samba-technical@lfdr.de>; Fri, 26 Mar 2021 16:30:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=io/432cXEfAZG276ek6vj5AUmUN+VH0F/XM+vkT+xXM=; b=1i5UNWn6yVBFz95wKYQwrA0Lie
	qwOkptEuUv2g3OJzhsIcHe4TVYmWPvq+SEhOHTYQ+3CRBjZdZM32o3zFjU9RDEvSBCzXFmjyXrwSw
	Ius/tZNlKAtk2xCEQnqQAQOu8ka++2hyjBWJdWWJTpkf0HKfuF/SFmlX/XK1SqiXmT9EU1y/BvyTX
	iBi9FszU91rL+hjRvqlCEvaMWkwKwycEZIT9YLIuCeIBXvOYr0F8JTSL6Dgv5jrhpOm3iXaTBcufr
	ZP71Qx1bhpusl51Ee+xFBeQtTwScDiW8Q2UN2TJmZqbd7XC5wuGMJY4cBd/Mp1Dk+nc2qYBO+GNwh
	lpHRA/Hg==;
Received: from ip6-localhost ([::1]:27068 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lPoOi-006rq5-NO; Fri, 26 Mar 2021 15:29:16 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:42984) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPoOZ-006rpy-T1
 for samba-technical@lists.samba.org; Fri, 26 Mar 2021 15:29:11 +0000
Received: by mail-lj1-x234.google.com with SMTP id 184so7805887ljf.9
 for <samba-technical@lists.samba.org>; Fri, 26 Mar 2021 08:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:message-id:in-reply-to:references:subject:mime-version;
 bh=iklciJXyFYHThVx4bIuQEbfNxMOWWZ9ykpFkeIYLNeA=;
 b=X1Wnbyf5p/2lmC4+1/k2wLE52G+P3/THEg1RhyyduMPyug+pjuWeNEsOq9f7tr9Zb4
 SeaxQJZtPfzwEnZHPBVcBpIhPVoF97HVBRnkggfyEMoeyq6mzY/SJyAqRCFd9RX/bZz6
 B9azOFHaJWqDP+U1Dq6k63jVsoSZ5rfcsV+DQ0IN13c2roFUAxNLfY+tHmb+VGC881Zu
 JPdJe9Vxy07oaqfw0RnAOtpJofoFa2fsBrIRvPudk5tUQ3K6IuNRmXfn0z3bgqX2BFQk
 etpg+XLynfYjajtx26idpB4bdRMpfy4NpZZctOVnWR2mkYJDjSY6xcxvoDosNdoKARc/
 zDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:message-id:in-reply-to:references
 :subject:mime-version;
 bh=iklciJXyFYHThVx4bIuQEbfNxMOWWZ9ykpFkeIYLNeA=;
 b=ZNfKGP+R+ShtYpA/dB4dhZB1eaZNOGwX0ipgbsc/jtCbZdFo3rXZeuZ12HuxSEgekO
 qXrU1IOuWkgOdKuQXrfLHBY3O800M0KgeUKFpDmKB27TuKTs6XrP3MTMr2dgnYhvsUts
 UYqY3Zjp0/TqcEPNxO8Hga2NkLcIcFemGJ7UNfI+YjFAxYTUtcTUS0+v+jAf9dYEtp9q
 PG0jAHhYPrZam9r1e4oxZSpgGrQXTzFRJizZDCrsBJq0I16CfaP+kOf6IIKB4FqhIVQw
 RBLnFje2hqT2MK6V0hMqhGjYTOfxOUdLHD8K7D4PJaTvpfCoegWmfnWx4e0Wh6u6FiJ5
 2k5A==
X-Gm-Message-State: AOAM532Goa5P1K9LSbH+xUtu8dhuBAUOjKPHJ3zpgFtxZt0Z+mfZfJnV
 pfmlZxdvqcjKQw9fPoxV/4TTjqd02RkPHQ==
X-Google-Smtp-Source: ABdhPJwKNrSzReWsWRkulo0VtRQw1uI4cTIaENdpMWwBibbv29P2IO1wdGJ27AINnqwBvzRCOvRNaQ==
X-Received: by 2002:a2e:8e36:: with SMTP id r22mr9611032ljk.427.1616772543825; 
 Fri, 26 Mar 2021 08:29:03 -0700 (PDT)
Received: from [192.168.88.254] (c83-249-133-106.bredband.comhem.se.
 [83.249.133.106])
 by smtp.gmail.com with ESMTPSA id x26sm903565lfe.16.2021.03.26.08.29.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Mar 2021 08:29:03 -0700 (PDT)
Date: Fri, 26 Mar 2021 16:28:54 +0100
To: samba-technical@lists.samba.org, Andrew Walker
 <walker.aj325@gmail.com>
Message-ID: <a4eca426-b03b-49e3-9292-6dfd76b883e9@Spark>
In-Reply-To: <c34eafed-8d23-43f8-b282-6c98800fefe5@Spark>
References: <c34eafed-8d23-43f8-b282-6c98800fefe5@Spark>
Subject: re: vfs_full_audit annoyances on major version upgrades
X-Readdle-Message-ID: a4eca426-b03b-49e3-9292-6dfd76b883e9@Spark
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: =?utf-8?q?Anders_=C3=96stling_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Anders_=C3=96stling?= <anders.ostling@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi

Newbie here, but I would like to comment todays post by Andrew Walker=E2=80=
=99s=C2=A0=C2=A0regarding audit logging.

C systems programming is not new to me, although it is about 15 years sin=
ce I wrote anything serious. The proposed patch looks fine to me, but I b=
elieve that a better way is to burp and inform the user about the change =
in keywords/syntax, at least when there are behind-the-scene changes like=
 this one describes. Or maybe =E2=80=9Ctestparm=E2=80=9D should look at t=
he config lines a little more in detail. Maybe both proposed solutions co=
uld be combined.

Another point is that the logging format from the AD-DC modules seems to =
be completely different from what SMBD uses. A common format would IMO ma=
ke it much much easier to consolidate, parse and analyse logs in an autom=
ated way. Maybe that=E2=80=99s a pipers dream, but still =E2=80=A6 here i=
s an example of what I mean

AD-DC (Global config for formatting=C2=A0=C2=A0full=5Faudit:prefix =3D IP=
=3D%I =7C USER=3D%u =7C MACHINE=3D%m =7C VOLUME=3D%S -=C2=A0(seems to be =
ignored))

=5B2021/03/26 16:09:27.394208,=C2=A0=C2=A03=5D ../../auth/auth=5Flog.c:65=
3(log=5Fauthentication=5Fevent=5Fhuman=5Freadable)
=C2=A0=C2=A0Auth: =5BKerberos KDC,ENC-TS Pre-authentication=5D user =5B(n=
ull)=5D=5C=5Banders=40HOGANAS-PLATSLAGAREN.SE=5D at =5B=46ri, 26 Mar 2021=
 16:09:27.394194 CET=5D with =5Baes256-cts-hmac-sha1-96=5D status =5BNT=5F=
STATUS=5FOK=5D workstation =5B(null)=5D remote host =5Bipv4:10.0.100.14:3=
9820=5D became =5BHPAB=5D=5C=5Banders=5D =5BS-1-5-21-1399469354-194187579=
0-2784827883-1601=5D. local host =5BNULL=5D

SMBD (Global config for formatting=C2=A0full=5Faudit:prefix =3D IP=3D%I =7C=
 USER=3D%u =7C MACHINE=3D%m =7C VOLUME=3D%S=C2=A0(used as specified)

Mar 26 16:10:45 fs1a smbd=5Faudit=5B62673=5D: IP=3D10.0.100.14 =7C USER=3D=
HPAB=5Canders =7C MACHINE=3D10.0.100.14 =7C VOLUME=3DDokument=7Cget=5Fnt=5F=
acl=5Fat=7Cok=7C/share/documents
Mar 26 16:10:45 fs1a smbd=5Faudit=5B62673=5D: IP=3D10.0.100.14 =7C USER=3D=
HPAB=5Canders =7C MACHINE=3D10.0.100.14 =7C VOLUME=3DDokument=7Cclose=7Co=
k=7C/share/documents

I have a few more thoughts, but I will save them for later. I will downlo=
ad the sources myself and see if I can understand hos logging is structur=
ed. Who knows, maybe this old fart can contribute with something later on=
=21

Best regards=21

Anders
