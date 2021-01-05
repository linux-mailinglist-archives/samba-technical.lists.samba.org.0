Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5632EA61F
	for <lists+samba-technical@lfdr.de>; Tue,  5 Jan 2021 08:46:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=eTMVw5wQCsdXVXMJgOx13vzhYuuLgs95sogOFkQUKIE=; b=VuyVjbqrX08A5pVGvoVjZtyndp
	Lnf7+ZjOJhq9ivmsBqzN4+ec14z8SvMw2YyfbuaQJMLMNV7oTBy9/dg4pEAoQAyeG6Py2yvgF1GE0
	3Vp+ea3YWWSyPn0zJBxLloYbPVjAEKwV8AYDEP/gPEryQexOfNLUOgQKfHA2p2idJdxzrUH2i7arS
	V4n7XuICDbBeTP5BErp51QCCHTjxM1yNWwL6ObBFUcpWKDmXd+6HTGstbFZmPfgV/yz+KSqVKmk4R
	SUSn3t9sqkOFkS+pR9f2v7YURkhPy39qnauF1EhFExgLScqTD5H95kWLsMKCev6WLU31QCGh5ievh
	TQxoMX0g==;
Received: from ip6-localhost ([::1]:49114 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kwh1g-004rTJ-Em; Tue, 05 Jan 2021 07:45:08 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41127) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kwh1W-004rT7-IR; Tue, 05 Jan 2021 07:45:02 +0000
Received: by mail-pg1-x529.google.com with SMTP id i7so20753198pgc.8;
 Mon, 04 Jan 2021 23:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Yn8yEvVhwXWBUDoxV53Gr6DylSWXCEsGft69v8NJHBo=;
 b=Y6nCOzb7r2y8L6+79As5nEWBaF24f/HuBDrjl1ofUvKmwk+gsEJiddgy4e/xNv5uLa
 7EwLtRHBhl1NWnLeeaYsJW8C0M0nwrpyqipvtDJSdtx1jqbVUaPuTeB/R+NVkwxhrNgJ
 4cZwEyvSpKjX5wF4fqmapVS+agKoBjcYRKmtgcMn3sj/IG7jqprdLfNUImarGKptv8H2
 re/yH59zhSgrRAn/lyM7p31iZAZ3oZs/OOLnRRr2zTKhV7DYlRmi0tSLeyf9KsJCeIHt
 zE/Gj0a+iC1pnN3+AW00IEGNpXKK9aoYKm6y8nWx5ZFeq/2fAbWyjA7JWhFdAgYnvYxG
 xeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Yn8yEvVhwXWBUDoxV53Gr6DylSWXCEsGft69v8NJHBo=;
 b=nEKlSRZGK2KohVWvs/1ZuOqAycpyMkep6RIJHA9huy0UJPOX/0kD5N8eswJfHqpyf/
 GuI9dGfuzsXi3RMOAcBm12WxkC2C73Xicty16czb5hwuXsJ3tV4mcAHllDPZfB+qzLFO
 qXNp4eydQ6pKlWaibeM5nQWi8uO5QlGlb0rV1EMfomKhTcSPnl62taaFvQmp4INfTXlA
 339HFWMBfcHz4js8IBh947hXS0GN0WITqZVDsZ/T7m2AyHrhBMAqq45byKpnNXMoMIlT
 ziBRDmCsPxMR4wmRccS1uFPB8UgoTpbfsAR98JGnqCvmgZEATxGkrN6wrcIQB1nGuZQp
 tJBQ==
X-Gm-Message-State: AOAM532y+gskmWRgah06qNMFnWFF97UcKBm0ndHkNjm7jnUtlV+vYMr7
 hqdbbURE25E4j9Fy+iOrZ+ADpwU5iRKD67/7zjU2hdU+tns=
X-Google-Smtp-Source: ABdhPJxUlA2m9CBm9SrvHCVKuzBHw2NFp23jPp+ZURMIQ2iP44h/hsvRZ0XeTpBAJNNxmnHlWm42IXFwgYMIQ7Yu0VY=
X-Received: by 2002:a63:745a:: with SMTP id e26mr74673703pgn.321.1609832684535; 
 Mon, 04 Jan 2021 23:44:44 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 4 Jan 2021 23:44:34 -0800
Message-ID: <CAOGdD2oUwmRRCC5JQ7d+0=187ruhoL0N15suf67GtWrav2qhrA@mail.gmail.com>
Subject: Samba and Adobe Illustrator locking issues.
To: samba-technical <samba-technical@lists.samba.org>,
 Samba Listing <samba@lists.samba.org>
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
From: Yogesh Kulkarni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Yogesh Kulkarni <yoknfs@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

 I have a strange case of lost updates with the Adobe Illustrator .ai files
and
 samba server. I am writing this to validate my findings and ask if there
is a
 known workaround to this issue.
 The samba version is 4.9.5 running on debian 10.x and clients are multiple
MacOS
 versions.

 The customer reports an issue with multiple users working on .ai files.
Here is
 the use case -
 User A - edits a file test.ai and saves the changes
 User B - opens the file and expects the changes to be present in the file.
 (almost immediately). So, they are not co-editing, but opening the files in
 quick succession.
 However, it turns out that User B cannot see the changes.

 Observations -
 On the client side, finder shows that one or more '.tmp' files are getting
 created when a user saves the .ai file. These .tmp files sometimes go away
and
 other times stay till the user disconnects the share.
 Network caps indicate that the application does **not** use oplocks/leases.

 Hypothesis -
 UserA writes to the test.ai file and the application writes the updates to
.tmp file.
 UserB has their finder open and obtains a lock on the .tmp file. Now, when
UserA
 tries to rename the file from xyz.tmp to the test.ai file, since UserB has
a lock
 this operation does not go through. In a way this is a deadlock as UserB
will try
 to open the file to see the updated content, but it cannot do so, since it
locks
 the resource and that prevents UserA from updating the content.

 Experimentation and results
 In order to verify this hypothesis and cater to the customer case, we
experimented
 renaming the locking.tdb without restarting the daemon. This addresses the
issue.
 Obviously, if we take out the locking component, there is always potential
risk
 of simultaneous users overwriting each others data.
 I experimented with the locking = No, and checked with smbstatus, but with
preview
 enabled, I see that a .pdf file shows as locked in output of smbstatus
command.
 So I conclude that the samba process internally acquires the advisory lock
on
 the file.

 Is there a more elegant way of turning off the locking than just renaming
the
 locking.tdb ? We do not use clustered mode and will probably never support
that in
 the product.
 Are there any such cases seen in the field in your knowledge ?
 Is there a tried and tested solution to this issue ?


 Thanks and regards,
 Yogesh
