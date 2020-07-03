Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C240621392A
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jul 2020 13:12:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=NNKk5MmP3xOBWpsQTz/tQTXT88RovXD3Bon16NB/ov0=; b=TCvjhBgeJag7NH3X9tOiFfkJv0
	knqNzazIPod2Mqlk/tXVXG9+Z80CWHNhbI0BhdHDs5Lp/onBQFzkYEK6/uE1ql0/f7k6E9POqaYFr
	yT+YgD+6rsfluWPvgmpDZ7D2zbfsz3+LfL5qUkmbcyYPAjfA6k8ShV/P3Af1O30PCMc7PVAPZ9yTa
	7pMzYKjXJXUSRS0r5XlVkbNZo59bChgYgCQ6PVVF1YYEo7vp4magAs6Ipk4Zbxq/iBs/WnPNq0n7G
	DtUOEGKJzfWllaxf+LNaB+xs6F6X680BZn4WcFF6YRZUtVMNhwMZOUt625i56Ec6EZHgqiArYOvmd
	WT4btFjw==;
Received: from localhost ([::1]:19094 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jrJby-005GGD-0N; Fri, 03 Jul 2020 11:12:06 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:40230) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jrJbs-005GG6-2E
 for samba-technical@lists.samba.org; Fri, 03 Jul 2020 11:12:02 +0000
Received: by mail-io1-xd29.google.com with SMTP id q8so32082254iow.7
 for <samba-technical@lists.samba.org>; Fri, 03 Jul 2020 04:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=6mip/vg9JB3BvNBgXO1ILogfEbM8O3tw3MI68DWP00U=;
 b=SoHytS2E4hH/o7dizYWgdzvGvNdpkyuo4A2CsJgm+mSpOp5wmJq3TTZ7oyIFX4wUz1
 kggkPJa9i9SE5zb3qxXIBmVBtBvn3cExYVhkD5efa6dCgEg1dYkyalP2JfSfqyV7tZ7i
 CQd5zlwYs2ro8Mx29VylqxqLymaW531tzQeZxMU7uuQ/L7PePPbs4j7KoIycP95c+0aw
 90Gp/L5aU/rbh1T+k+Cht7kdhcEAFFgQktRpMs1GxpyTud1jVlgmYxXncPiXdZYjOF9a
 WKwNr4ISajouUSL5J/Ojk3UINtJ3O6IJCquvgpUnzO+UQXr1Mx3J+xQJlYIY4K26q842
 qMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6mip/vg9JB3BvNBgXO1ILogfEbM8O3tw3MI68DWP00U=;
 b=Qj46XQGIXzQAYGcwkCG0DlSv9IFlksBvLpw9VLRZbRq4TBcYSMfn9962GUj4oLkMv6
 QTUBUAslI2FG7HIyJ1ryUm2kjbvxVLntwZfQGwj2lH7BtXbxHurSnd+lBIwHxwVwmaoh
 M03uesBPRdwFgxn3HQYuYqw4Werz0quGIaQemJYWdwfs5dpmFmHTbfW1rd6cHjrIHn+P
 ElJpJ7N1ezY7/g1mWedugJhbLkMvoYgtV//oxjUSxDgLyFy5DjQNzFtQYrvwIKggEOzo
 t6Tq3W8rHuTUZl1cIoU+dG2G5RZxhchOH2UZJ+8QZbiFy59RFiaRuZF+wGyG/2jeQXJ2
 mYkw==
X-Gm-Message-State: AOAM533rOlcSb3TFrMU/LWnps8tGRkhuhW2ElZXVn0lyPvMHkYkezvr8
 FmwkEeSPSaFLpDbbJgtOZR4uivHducSeBXYrxqRolw3i
X-Google-Smtp-Source: ABdhPJxeJRVV8Qf89hOQoN7tWSBI8GKf1hCncc4FHyhcCV/pxA15AbvoJzkVUbW0F77AFchN6FbnTWDKYZrFcsPSyI8=
X-Received: by 2002:a02:6d25:: with SMTP id m37mr15474515jac.10.1593774717733; 
 Fri, 03 Jul 2020 04:11:57 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 3 Jul 2020 16:41:46 +0530
Message-ID: <CALmqtCV6cAiLua+kmfCdCoTKp0fTe2s1=_gVk6JEHz2B8JRx=A@mail.gmail.com>
Subject: Query about second connection request with same tcp tuple
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
From: Abhidnya Joshi via samba-technical <samba-technical@lists.samba.org>
Reply-To: Abhidnya Joshi <abhidnyachirmule@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I have a query regarding smb connection request. How smb server should
behave if second connection request comes with the same tuple as the
existing one?

By same tuple i mean, same client port as rest 3 things are anyways same
for other connections.

The existing connection request is also just received and on the verge of
getting responded by server and this new connection request comes with
client's port same. ( response time is well within 45 sec)

I believe,  the new connection should be straightaway rejected as it can be
regarded as duplicate?

I did not find any specifics in MS-SMB2

Thanks and regards
Abhidnya Joshi
