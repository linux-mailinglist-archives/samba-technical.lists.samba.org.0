Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7375967D3B0
	for <lists+samba-technical@lfdr.de>; Thu, 26 Jan 2023 19:01:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=NHYFvMsRt3ucAXXsVEwJAQZ+no0DFFG3grm55pDMtQc=; b=NurKME8SHAsVV21ZuvwWipjse5
	ggVrE7NdpQuy/w4/BChNPe97OQFDFWaJSzdWbw8Tw1PEyNl5xawYococXAF97e+FjDJQ4fThIIVRq
	NhDK9Jv70QR0yByL8jy9MigU8tcHevYU0h4GtzK1h2z1DtsrOxJFtFlxc/HBjLh6+MjKVMwO1a4xI
	leJxnrLZhEDEhifmy/RaMd462Lf4lRkWK/Mc9g6JWkyli0LfdMYzKBgBNctQwkCrVSY68eTJcG0DJ
	I+aVRYoUR79ecZ8h2noDKd6J4YCkN6W2qqsvUDPiG9rb6/mncAGH+C8za2/XDmbzZI9Sqm3otfC6c
	GSLm3Q+g==;
Received: from ip6-localhost ([::1]:43202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pL6Yi-003HsN-VH; Thu, 26 Jan 2023 18:01:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24508) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pL6Yd-003Hry-FZ
 for samba-technical@lists.samba.org; Thu, 26 Jan 2023 18:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=YCPP5EdLa9aIN1OlwZ65FH91aLn5CSWqmIaV3nuHQ7Q=; b=EkIinDBcosEMVCDossdxRq8qeL
 6s1Cvsg8/kk7vaQzbbsLmVjqA4ftXk/3hgIEjJxxq0kRgfaNKSmTZcc4Nyjm1AMRgQEP7AxIGpZTT
 4Uct9uVyrbdZqKvSwXOEOfG/GC86LypwVM3EJZ2W5ZrlpAS43UpzKyBsuVv6Q7O/XfgrkfZi/N/pJ
 p9eJupCN3qCVXAKjYOOiCw6HEQIk3uwioC6jBAaCpSV7JGOjyAnqzHJn9EvRbZ8twFXm8jFqOB5XT
 ETKb9Of/ElYl0qbpKbwDVuD9o6U1MxyAQx9SGvDPxodxrt8yQ01+lTgGjhEaakAHzHapehRGMpFuo
 Embz2JEf4zqQSt4y/JuSFuGRm9P8NhU6zYcH1Qv/HWrqH68TCnPdPTE28A86/XjElZ4zBjHHnoVHI
 Gl/pf9P5O4/zvnU5uxiRclmawvLJ05mxrRQ++OSvhsWBNidYv33jdxcaweY3kIjO5dLRApL0sR2v+
 BXf0TqAPuJ/OhZ29Bzkr/OiI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pL6Yd-00APSY-8x
 for samba-technical@lists.samba.org; Thu, 26 Jan 2023 18:01:07 +0000
Message-ID: <2eebb362-4605-9bdf-7dcf-c422e48f5833@samba.org>
Date: Thu, 26 Jan 2023 19:01:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.17] Samba 4.17.6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.17.6 is scheduled for Thursday, March 9 2023.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org
SerNet Samba Teamhttps://sernet.de
