Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F201CB8F50
	for <lists+samba-technical@lfdr.de>; Fri, 12 Dec 2025 15:28:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=MGXTdT+7ijtscJ1ywQZqHuvtwMUnw7a5X7bAoCCtvQE=; b=QD/9wzWL8D0QGiNhRajVedpL5i
	newLEYmqFJYTtTyG24GSUSD6lmGv1M2azI4e6aAdHYIpAcVXZXNZpsiti8+/W8PZlS83CPkdFdnTP
	WlZopgdPcYETD102w0FA9zClgnrID4ghQRlyoA4wj0Dq/ukyn6j84dQvRrS5wpaU5bxFvV1HyZlgh
	VM9bcnP/wYRRQe8X3yh0ymd5ERA2NY6flPP/zAgaQ4HESB0dr8efn1as3DEuwf5o636HK0Mks6XNO
	ZkvTkirGTgJcC0yyLnyNytlqv/kQsZ2Ew2nYiAtobgDCX4/SD1kfqAf/ibsw9Cmr5Qi1onK1EGkZJ
	m77tj6nQ==;
Received: from ip6-localhost ([::1]:42452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vU482-00G62P-IA; Fri, 12 Dec 2025 14:28:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43552) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vU47y-00G62I-3I
 for samba-technical@lists.samba.org; Fri, 12 Dec 2025 14:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=MGXTdT+7ijtscJ1ywQZqHuvtwMUnw7a5X7bAoCCtvQE=; b=Q4JRiFgW9KxewG7YL7yGclWKFs
 OBCe0LiYmv4SjxDAGEDQcjAAOZSys5JfhTVHNBFmYw0qXO+B13qFMFLCJAMuq4PfuxZSncn9LU+hi
 0usjIrkibItbS+P5lxXdbvVSgdV6j9fGrqml0dE/8ZT6Hjg9oZKqCi6IjFsk4/Rg/oTSkkavaoKp4
 mWJh2kVS1VGNoB05GU5u58YCOcMOvQAM7uizgJFru8Olfj8CWmFrLom2i1p7T+J19kiEagcM0EQ9B
 gQj3SinnkC0LrWeud0J4Hnxemx5dmTwEJK2koEQQk4n0BfCoaFJzMzS5lbdjORXlmDheIFCn9yfGc
 X70VBs+bg56aMJ3fu4ALlIQ5x8Vxne6gGel8Ve0BME7jbwSK5DH6TthXJ0uV6ZtwbhA6YrmcdeC3W
 PzxQHhZM//BayjZ2LTeW/iTFGaXWeN1XiCZYvkOH5GxLCD7VhE3JAh3PyKXujHeiDY73mXUwN/4Fo
 B/EcZy2klkcjavTMnNyMmTXA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vU47x-000Pw3-1P for samba-technical@lists.samba.org;
 Fri, 12 Dec 2025 14:28:13 +0000
Received: from bjacke by pell.int.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>) id 1vU47x-008uEH-6W
 for samba-technical@lists.samba.org; Fri, 12 Dec 2025 15:28:13 +0100
Date: Fri, 12 Dec 2025 15:28:13 +0100
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.23] Samba 4.23.5
Message-ID: <20251212142813.GA2121947@sernet.de>
Mail-Followup-To: samba-technical@lists.samba.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bjacke@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.23.5 is scheduled for Friday, January 23 2026.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.23
has been updated accordingly.


Björn

-- 
Björn Jacke
Release Manager Samba Team  samba.org



