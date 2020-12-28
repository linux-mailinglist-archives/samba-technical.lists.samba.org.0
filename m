Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C332E6A98
	for <lists+samba-technical@lfdr.de>; Mon, 28 Dec 2020 21:30:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=eTMVw5wQCsdXVXMJgOx13vzhYuuLgs95sogOFkQUKIE=; b=Mdp7fz+2up6PGXrm++AAKhy5WS
	c/VOAgRmYM09vorQZoozxCi2rxUoiWhlqFH0V2XiNq+8cIen+C0AX+dw2g/B/B3tINdrG1h7ZApXD
	RR3ugVGZHcsTYkfifcf5n2d0mfURewHc2D1LFtcfjo7tyZVgYLnhHjsAjwvlBPoIcMoVb/DvcWlLk
	g1rV6lpeGS/bW9x25FExI3mPLnZlWYSUDLddIyrIW9OCBEUSQ7JQsA2BfJJhAuLZUiNmE/ZPaOjqC
	VoBlL5wptTAmJ7STqlp8A6S635GhE5tyozHssDq3zXf5VtrNTAj8VuIGUGolaipExJK7ice1I3MIf
	wurWOz7w==;
Received: from ip6-localhost ([::1]:60232 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ktz9L-002YOC-GH; Mon, 28 Dec 2020 20:29:51 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:39544) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ktz97-002YO4-FD
 for samba-technical@lists.samba.org; Mon, 28 Dec 2020 20:29:47 +0000
Received: by mail-pf1-x42f.google.com with SMTP id m6so6827251pfm.6
 for <samba-technical@lists.samba.org>; Mon, 28 Dec 2020 12:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Eu4idPTZVnK+515WO9WPQXQ2elZT59LDbXbLB1D07Wk=;
 b=mcvJ6t2UpsaU0e4KIdHmvR4R0tAYSKDuW60sS9mF5Hc6oq/SOdmHMAVk+wbGZvQhqh
 uxCG/YUSLknxG+DVnrBZzEp7c71yBligQFIltlTKAU9Wfh4U60+nszc14P4k5Mo61xGr
 7p0gLApFxJDn5ntt69qtbOInvpPArVMNw3G0yvmtGJAnQGXkeNM2QnYcSy2WGb+7YU3N
 BjY2gWns72IceQ6htRIk1XDPGdL3fzoLR0Sh3jiI7KqXLJgcIxzoFRQ4IyyUmh7YzGqw
 e2CNGV1qvsA4u33Qr3fZe/e4sWK+y4I1/Pcp7ymT3tq/unXcdLkTj/TSPOhDL+lxJcCi
 atKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Eu4idPTZVnK+515WO9WPQXQ2elZT59LDbXbLB1D07Wk=;
 b=SLGzbipI+DwIBSHvceIUqecWYB5mcO9FxCdE3dt9WY8+hNZwUhZZW1h6TicoXFAO1L
 jHQUem0V9rnuRjWXkYNWlf2MBoEXe39t4rWWFciHGP9JWavmiZlCIfOzAOKkTQM3lzZK
 VB4uJ1LKa8nPuzm2seNmWukQO7WrhTkTm/rcYi3OCI4OtJPz1pgCl5Y+MgCRnm7N76+7
 fPzXymfJ/3dLiRPD+wYUi4tFPzItDaELb1+ZmrTPTgEpOn8kUwjOCliDf380Jmts9h1h
 MRz77dyjyERhOBmKwnCPPyDtUvmb0+yQ2jYRijmvIjE97ONl0wB5V2Clxt9xPvo3+Fji
 3zwA==
X-Gm-Message-State: AOAM533t8tx7WwJpQXUHtMfNGfsJFyjrtaLsd/jYl07SZtPqTCWZnc78
 VKkikYMGW0frGCbqexqi3luJnGq2Uh8FZoe2/mPn6H4T+FM=
X-Google-Smtp-Source: ABdhPJxOyVVYHit/vh76rt9SfL0i+2Buk70Z4gAeIe2LVczyYbqBAMw06B96dUnw5c+n8Yh4qdiFT+wTKLpaPDqt2e8=
X-Received: by 2002:a63:745a:: with SMTP id e26mr44980614pgn.321.1609187355654; 
 Mon, 28 Dec 2020 12:29:15 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 28 Dec 2020 12:29:05 -0800
Message-ID: <CAOGdD2ouQJGJBgfC3QJVm5PEACdQy7W=GH_rN=9NHg3nKQi=Pw@mail.gmail.com>
Subject: Samba and Adobe Illustrator locking issues.
To: samba-technical <samba-technical@lists.samba.org>
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
