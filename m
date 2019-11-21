Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFFC105911
	for <lists+samba-technical@lfdr.de>; Thu, 21 Nov 2019 19:10:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=+ujZnqrlu4W/ASdb56U4L07F2DRkcWPX2Q1sfhPqUdE=; b=BXD9FdulKCnOYFDttnQM1v3yRV
	yc8zk4oELBfxkP2T0+rsjrCD5FHqwqExvdlBUzkVJxnauObokajo+u1GIQaVg5saP5y3P4DKcNxqK
	1qUQcBtspOulqiPdjDDjfxBL/PizQUhU22jbbJYTtibfEROlBekitoUWGxR1c7WIu6jVsAxwzUZzy
	fwcGQNENfxn8ROPbfzJmGHhT8tC+M48CTwUfwVII4bl5bYiZZe+D+QlAzzntn1r0r0fo1mdoJ0Xc/
	f9+rmIqL19NMW4YLMWc+bt+q4TnkZ8E4NMbw2t5TVRLoLBq2juMh3nMBHhCoSSaJPY53RmxJJ6ZPa
	qBQbNlYw==;
Received: from localhost ([::1]:26598 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iXqtt-001w0B-M4; Thu, 21 Nov 2019 18:09:53 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:38848) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXqto-001w04-Jj
 for samba-technical@lists.samba.org; Thu, 21 Nov 2019 18:09:50 +0000
Received: by mail-ua1-x929.google.com with SMTP id u99so1295657uau.5
 for <samba-technical@lists.samba.org>; Thu, 21 Nov 2019 10:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=A6TT/cOA6ecTIEqv5TPBEzoScBqp1g1UQrzHlRd1zug=;
 b=EKlSaDvBLLBV3MitShzvSt+3lx136az/fljqucIjxid9hWo1ncKFVQIPWV7H6bJ7fV
 jC4NJNeFOTQUld7gVV6Nc7fk9SLQIpGQfJRIjDwRFtK4cTaP9AoOFeBMWOt9eFV7SvS3
 vXPogZL04eFS01YbtGP/G1ZgUHRvY816Asd9TGbjIPCD1o9DhaHBRHHWxRR3cWkl5l6G
 pJaneOBqKGjI7F+E0fci37XErbuFuUupb8mYPOHt24OiyHKr/YrSQnCdSjhG19HZ1mhs
 4DXtSIEloM8/r0Hk/q4tea6/Nn9hPSzQgs0ocvsnzTuBgBUnkTZM93LeR+kAm+/eVS/o
 aGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=A6TT/cOA6ecTIEqv5TPBEzoScBqp1g1UQrzHlRd1zug=;
 b=BqZ3OP1E/bY5kuVTfw28rOpl8tchRtZ4GLLnJL2b+aS/PSGVmAmpum0s7p2wmooTFE
 LFKM/4KgkHVtXQpu+GbpSqB+mGcNN/W20Nazy/3lIk0C3m/mwnjOJ8zH5Am5lHwiwbgq
 mOAMsRyo8IVIttWgpcvZyCI7ekK9jGtorxsAAZnZthQejG8E/zjKj2QqEfsGBstQgQSf
 U6naUNoBAUJ5+XaOsgIsJs8cHREgI37u0aWUFpiNy3A8MdJ7MDf464kLJhS+UfrshsTe
 jTo7+TBrGpEs9C0EDx/pOT77VMvI0GorqsJQW+bFdB9fIk0cGjxo+Xu04CnOsw49gerR
 bp9g==
X-Gm-Message-State: APjAAAVMSPFP4GnfV8QULvovpQKcSClxWqxiYihMkeFgKzYKLhCklct0
 4G2WnD3ho7bd1d6uk3OQduHXDaw2NB6pkeJnTRJaHN855Xg=
X-Google-Smtp-Source: APXvYqw8XSOitdPul3yjnS0OvBVL1oMcxcY9h5yHVzVTvxBmZj8csKMVZlU7ZdojWzbrEPXmnYWflGqz1TEBvinAYRw=
X-Received: by 2002:ab0:2601:: with SMTP id c1mr6255359uao.11.1574359786687;
 Thu, 21 Nov 2019 10:09:46 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 21 Nov 2019 18:09:34 +0000
Message-ID: <CAGYhc9=AZmkOjHAGx7rWd=iM6h5BaVohym+oWMWqfNEfNtju3Q@mail.gmail.com>
Subject: building source3 subsystems and libs
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: moore chestnut via samba-technical <samba-technical@lists.samba.org>
Reply-To: moore chestnut <moore.43132@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

  hello,

is there any way to individually build subsystems and libraries?

for example:

the msrpc3 library in  source3/wscript_build
bld.SAMBA3_LIBRARY('msrpc3',

or
bld.SAMBA3_SUBSYSTEM('samba3util',

when I try waf or waf msrpc3 in the source3 dir, it does not work.

currently trying on a 4.11.0 source tree.

I have read through the https://wiki.samba.org/index.php/Waf
and tried the samples with no success.

Does this work for source3 libs/subsystems?

Thank you for any guidance.
