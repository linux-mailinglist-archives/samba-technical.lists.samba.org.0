Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9675F6D8F
	for <lists+samba-technical@lfdr.de>; Thu,  6 Oct 2022 20:37:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=jLcWJzVFRBhXr57AfTb54uE2TD0xOZkXFtcvDlVxfXg=; b=1S9TLVtRxDWWvB9wWCW+VxKXI9
	XZxn/dTMdZyNqt/3rEzTdRWm51DM8cBYTukhiXG0HReE9/p362EpYeg9+LfEobnuGktuGHzCGMXix
	78BRlos8y8ZDykwY/KozIVwAZ104VG0kPUUHXxjIO9s7TtqRJd8Vic33ggwSQQ5HWL/PyR6rb60BG
	VV/CPF5OqqDbjXn4RoD7NJf/pRmFvLhv8xMOH8aBvSrGrfQe3cmWxhQtRLqm3LBKC3tfhY5MjvZSu
	u5HNBT8WHHdK2Wrf0OWUTsGKwgkId4OTdWgAlzrFKuP57mgvzUSXU4EZ0ZBNePfJoq921gHmUVrtx
	pkHlZaFQ==;
Received: from ip6-localhost ([::1]:47918 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ogVja-000HcA-EW; Thu, 06 Oct 2022 18:36:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16004) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ogVjW-000Hbw-Db; Thu, 06 Oct 2022 18:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=jLcWJzVFRBhXr57AfTb54uE2TD0xOZkXFtcvDlVxfXg=; b=niuzJsBTorQaTR2rhQ0zG74jyY
 XfxTQmmhgOUY+vkb5DbLSyYWdat6bV+Eavjo8VbTu7LVRAJg3Vj2u1PWfn71+ykgZidJlo7voCvG7
 +waceP5Gqleb+0d4Q5mra3FGqJztKjqGH6PcqhPpviWKRIGk4Y7GrmAKWl/UHpk37kUt0Hz+Y88/z
 asTHzOygr96NycbtaZmSEk4IYhQdLBfqjapYfK7vjHfZBti/qnSq8J9PzQwrjq2UjKKMedR6D7ig0
 H7aEOVnw+nolysbgDa//dHvWerQxMOY4AMKAtWy1uvaM4fX6UHkSfS5pbA66h7x3Ju9Ah9Bvj7ir2
 8Bq0fH/c8VhRHpJj8Vdh3PCx29Mr2mDJ5fpPfOWBfrYDWFELt3I1bamNmM1fbtGJ1bPMs7Gz7oac4
 0gxUoilRUQ66wr4st85HOfZz+nOZ7uoUztUhTVJmvK/IsMGjp8JVGAAnCaEm0GaVcHawGQEw1R6X9
 5FU14AxHFTqUpCYYLrJDVWX5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ogVjV-003HAC-4G; Thu, 06 Oct 2022 18:36:33 +0000
Date: Thu, 6 Oct 2022 11:36:30 -0700
To: samba-technical@lists.samba.org, samba@lists.samba.org
Subject: Samba Talks at Storage Network Industry Association - Storage
 Developers Conference 2022
Message-ID: <Yz8gLi1yArwl9g8I@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Enjoy everyone !

smbd, quo vadis?: Volker Lendecke SerNet GmbH

https://www.youtube.com/watch?v=ML4h8SuNQwU

Accessing Files Remotely with Linux: Steven French Microsoft

https://www.youtube.com/watch?v=1g9OBZ09Y9I

Performance Improvements in Samba's Pathname Handling: Volker Lendecke SerNet GmbH

https://www.youtube.com/watch?v=GqCjqV9T8nI

Kerberos/Authentication Updates in Samba: Stefan Metzmacher SerNet/Samba-Team

https://www.youtube.com/watch?v=jAjTeczxMX8

Symlinks considered harmful: Jeremy Allison Google / Samba Team.

https://youtu.be/2BiE7zXdjzY


