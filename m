Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D87BB10FACB
	for <lists+samba-technical@lfdr.de>; Tue,  3 Dec 2019 10:34:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Yp4aeKUr7NyKJUAhjRHhu2mlIKomLD4DSWyhrjLFFt0=; b=Ks08ci1u3ui30L+rgoSWYlUZKW
	M4rx+8Z7ix19nmRXTXIRmjfs6y7zD4UQgxJw7dmQtAu4GGdJhX0WpN/bv/jelQwDNzF71q8k3IqWf
	jliUuwMgv+bw/4c7WjOJgeGOSASp8KsvmODLW5JysA2e4QCXzIN0eCpNkGqJYAP0GILyYMXeS0KJ1
	7XzYT1NAt9dHIPLbSblMuKS4+9vmI4KEH1BW/XGMMPUsXTRxaoKHIEHYgnFcnNuRiEIczM0UZYfXl
	xUo8wppjdJXi/dYHrwLYkk5Nqq4q7vYKmUdd5u1ghO9R8lORKsy25+lNucrylKH/7bLTfbRtYumVC
	yIQZQ70w==;
Received: from localhost ([::1]:23118 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ic4YQ-005mGC-1C; Tue, 03 Dec 2019 09:33:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52846) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ic4YC-005mFk-A4; Tue, 03 Dec 2019 09:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=Yp4aeKUr7NyKJUAhjRHhu2mlIKomLD4DSWyhrjLFFt0=; b=d9aFyKiEHBLs/BptJHAe2y1GOb
 XrOKjJWywNnaM+gZNHuna7YEXow/nP6F/2LjH1kOzfvZIXL5ObYbTMQkBMSXZpdcfl2WZ+IJhZkxg
 rDp15jEaGq/4o6rmYSJ52j9h3ynPhmzeHxW9H3S1c2aweqdbe45YXmOc+gbIjZK9lqQPezWeU+3oj
 AqH7ZeJO0kKBDUleixqZa7Nz7WXT5dM1j2UqNjd62GJIfHqqD+h+Pu8RC0prwQPAtcc+FulaLhPyo
 ICTCxPvOnzqazIpjvCGmFLRkls9YzzN4I6abJLRtonDKF1zI/QCqHrWgTdotkVUbxqdRhs0NvtkWb
 1YnqXZC1bLzqsFouuMVYQBvqPbFd3wp5sOpjuxAF9zvCr/xUazrLAw6qtB/b/lNm/exW4hvK2u+Ep
 1CEDgoOXNDnbabDnGh9cL9KXgnQLKLXv1aucl853ZuyfZXUZRaZdbFzPMITjLgIZXvjdKiYyAEYYN
 +8zBrMKr+5qkAUNV4mALJ8qk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ic4YA-0002Kw-V9; Tue, 03 Dec 2019 09:32:55 +0000
To: samba-technical <samba-technical@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 samba-announce@lists.samba.org
Subject: Heads-up: Security Releases ahead (December 10th)!
Organization: Samba Team
Message-ID: <017b3996-90a3-8164-a27f-9366fb5be15a@samba.org>
Date: Tue, 3 Dec 2019 10:32:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

this is a heads-up that there will be Samba security updates on
Tuesday, December 10th. Please make sure that your Samba
servers will be updated soon after the release!

Impacted components:

o AD DC (CVSS 5.3, medium)

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

