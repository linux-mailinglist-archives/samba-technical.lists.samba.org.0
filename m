Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 344D011373D
	for <lists+samba-technical@lfdr.de>; Wed,  4 Dec 2019 22:49:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ZiMnymbhbTWUbdPLIwYtY7WNJHqvWZcJbHqgVpmZ3Yg=; b=uDHJCUBPwRaV4j+QPsK5nq4SYT
	0jxqQ48DUcV1T2k+Sw+McgfQZfVi8AcqJCRAv9vYl54KfXjngt/pDxNvhxcwAGhhzKc4CG+BQjtw1
	ThlDraU3qxLLqNegfjyp7BC5y9yNh5+o0DpNAlDtFijAeuqeCR0CQXTwzvJpnUWJLGgioJo76dC+n
	1//1SD9oXwe+aKlM4+MrWs70QhCQWYwD2hyGqDmGhuDmR7pMh/XCcSFEUKR3w/FloojClA6TDvM75
	89gG+eBusycNrLCVfuCoXWtGw4Z9J51yX6+ZesrpDfbuS3gFmc3gTEj24a8XVO6skznruPDgxDHxd
	ldPEEllQ==;
Received: from localhost ([::1]:58054 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iccVS-0065LQ-3k; Wed, 04 Dec 2019 21:48:22 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36642) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iccVK-0065LJ-6l
 for samba-technical@lists.samba.org; Wed, 04 Dec 2019 21:48:18 +0000
Received: by mail-wr1-x42e.google.com with SMTP id z3so1043399wru.3
 for <samba-technical@lists.samba.org>; Wed, 04 Dec 2019 13:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=ZiMnymbhbTWUbdPLIwYtY7WNJHqvWZcJbHqgVpmZ3Yg=;
 b=PkjKcP118uvdPueU6kgKHZ4mPIYW9IR/YhNnuAEYbj0KgC9Ro+L3znN6yJjDIOug2R
 nw5z97ktgPDVHseOPoRJzfOaHgtco++3ISNiRBF9sv3nDxswXt1HrJSkdKJXLiBayuH+
 XvOR7CR8AxN0nugupkdrGMOBw1R+t3G7QkaDoF90+dkmy0Iyg4F6y5Hw1lkx+urUT+58
 wnbuAzDu+aGeVJS6qnnvOy1fC41k73qcnymWq25E0Slwlqwap1lUjKrfcojxzGr/vrBc
 AwgNwdlTI7Y6yNc+riQ4f3StNgjvflQQiKc4ubJhovyHiCcJkjPGyzTDCb7FSObkNAnm
 nqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=ZiMnymbhbTWUbdPLIwYtY7WNJHqvWZcJbHqgVpmZ3Yg=;
 b=eG0s1H/4TQCitm5w1ky83vhawatAZe2m1JIMNEyXZPnFP4zwp56XEunvAV4ZoZVBOx
 mxIumtEASAj7H9SjFswiZq8JOOnvRDyyqGSe5AqWRE0wqGGzAp9vFP4DKZ3mFgYfZ74d
 aozDY/lqV9kQ0yKjY1a9XP5jo53LTOa4bxmVD+xldU8Tt0jhsQXq086jH9/AbmHa7rk9
 NMmtiAXfN/RjBJKKRYiaxjdjAwpd5q3C9miELdIthzQTk1uIwCKsW71zPVv592WwQj6u
 8MjkWZnY1U3W2FXvFsA3BqWL3rnmZ7SaWt9wAJnu20CmR0wLlKKKE+AlVgd24jKwCByR
 g3MQ==
X-Gm-Message-State: APjAAAVTxRyhZldykkB5dQtT3NARwaEgv2AVi6Ytny3eRPJyg5Qf1zm0
 s8s4AzWWu8m2Hj0gv3/yeZGBiCYKz9o/6HgJf8ZrBipX
X-Google-Smtp-Source: APXvYqxunuhA8qplMYCrrgtqmmQnj307mu32cIkTuPPPEHxC6sBaQNvEprcflBww5yRRv1qr/s8p1tP2LPAx9v4muCE=
X-Received: by 2002:adf:f64b:: with SMTP id x11mr6761344wrp.355.1575496093108; 
 Wed, 04 Dec 2019 13:48:13 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 4 Dec 2019 13:46:14 -0800
Message-ID: <CACyXjPzkNVZOHu0eOhYeXGaWXsas6ZRN9qO1YSEHPo5xV3OTEQ@mail.gmail.com>
Subject: Just noticed a confusing piece of info in the Samba Developer's Guide
 in 4.11.2 and master
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGkgZm9sa3MsDQoNCiQgZ2l0IGdyZXAgU01CX1ZGU19XUklURQ0KZG9jcy14bWwvU2FtYmEtRGV2
ZWxvcGVycy1HdWlkZS92ZnMueG1sOiNkZWZpbmUgU01CX1ZGU19XUklURShmc3AsIGZkLCBkYXRh
LCBuKQ0Kc291cmNlMy9pbmNsdWRlL3Zmcy5oOi8qIFZlcnNpb24gMzkgLSBSZW1vdmUgU01CX1ZG
U19XUklURQ0KDQpJdCdzIGRlYWQgSmltISBSZXBsYWNlZCBieSBTTUJfVkZTX1BXUklURS4NCg0K
LS0gDQpSZWdhcmRzLA0KUmljaGFyZCBTaGFycGUNCijkvZXku6Xop6PmhoLvvJ/llK/mnInmnZzl
urfjgIItLeabueaTjSko5Lyg6K+05p2c5bq35piv6YWS55qE5Y+R5piO6ICFKQ0K

