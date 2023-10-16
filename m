Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEF47CAB77
	for <lists+samba-technical@lfdr.de>; Mon, 16 Oct 2023 16:27:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ZsZ30vWnhr5UGXHcaMAGkc6cLQc+ZO3XWDD5EqVOiJ4=; b=VDqXLE7YibuBqLvdwCb///pjEp
	oRZqf0w0fklbtJHXbhwxH6cEA2r1N5aT8dm7vh5sHqWIjtwRFajoxMHBwWBE0PS2icPQGRfq6NcAQ
	RTs2LlUNhx6qIGLaCf7hXADjQkAqkfF25aBxQ4tHlpz6JNx1PRtn7AZzSdl+Mki6++WVW0gf8C5O2
	iYuAbT50M2rVSXxuYYNA36c2n797M1jps+V+3dUPXG7B4KG1E8lHQBAt4fF4X9qVtnOeEeB5H5Bqv
	YCzWBLSmv1fM8R0dU/9ZDBD3YXHiqBiFC2XRmreNpJ/uisxQKvYNIP/tylP7wXEMEJQVXr8+ecTsm
	1dUJviMw==;
Received: from ip6-localhost ([::1]:25320 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qsOZT-000eg9-5P; Mon, 16 Oct 2023 14:27:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32928) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qsOZJ-000ebE-Pj
 for samba-technical@lists.samba.org; Mon, 16 Oct 2023 14:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=ZsZ30vWnhr5UGXHcaMAGkc6cLQc+ZO3XWDD5EqVOiJ4=; b=E9aZJUfZN2nc4iiH1fyzq4RwHQ
 X1Qk0N6RisqspCUXOCrjfLsTrESEbPpYpFBTR4cy3PoDG/Q7/G1neGns+roj9PihBiEr/ttgT4Ecd
 2DV8eRQZTilFqrpvM1tXe6IXrUT5uAz2CVcwj66Sq3bdNXUYQGPUwGF1+oj2QbH3CnSrfQk5EZn2i
 ivP+FtV+n38yFGBW0ICTV987PKEOWLF/4T++SnEQlNGxcIGv0ulv1AQvuTpTt8gCrS3jICdwHBi4/
 /WekvNqTf4BAXwdAu6UXx5NRr7nY5ptvP4kwa4gOzRLUOp5uWrnK5xp2FhBdNb5jN3JmGoWDRnyih
 NpRjnV2TN6d8ghP1Ot+vXZ1+vjyoAkG0Ps2DsSXaj9NHvOZpHdvZMDOk/Vrm81lt3Qwk5fGBOZBNq
 QUjv1ccntkLL/DcoRk4euRDbuUzn4WZADIBKNC4hJcLFr9VujgQIxtcGwRRomWxCEdYb4RhC6WNi8
 X60V9pO1tuE/whyNo98XdYJg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qsOZI-000thf-0v for samba-technical@lists.samba.org;
 Mon, 16 Oct 2023 14:27:41 +0000
Message-ID: <9757bb1f-ca4e-46bd-90c0-7ceccd16f178@samba.org>
Date: Mon, 16 Oct 2023 16:27:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
Subject: [Release Planning 4.19] Samba 4.19.3
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.19.3 is scheduled for Monday, November 27 2023.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.19
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


