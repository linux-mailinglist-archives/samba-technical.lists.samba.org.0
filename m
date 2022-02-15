Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 536D04B6473
	for <lists+samba-technical@lfdr.de>; Tue, 15 Feb 2022 08:37:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=wznT4D4oPYK9WLY8gGU9pGauEVnxu/pbt0yIiIv9ckc=; b=zdXPkY+Ldl77iIolIWSv70aluV
	NS53nvHw/KB1SiZoeGoEC8QCNw3HzSd/Bbve5DGMpDNbyMRGw/Ek+1qiFfBVZK0Njj74rp/6VmRBy
	asgYU4OBO1m+dRNtjNyFsrMTO35wIOI22oi7NILC7Xz4O+u1slmHr4Y4+RE3CEBwY6n2qu+gEfK5U
	JFKZkupx/66bAGObJ6uQ7ZRLecraOVolstjwYVKNfyXbR9nkh0sp7immcqiSpqv84rUVSgDpi9BWr
	qK9lCEMSP5Duj3p3wJ9aHZXOnRzOUxfVXZMNfhd3SKaSjq3xT030JLWWf6j/RDSdl1YwGUqNUDvef
	A/4bo5hg==;
Received: from ip6-localhost ([::1]:38800 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nJsOq-008VDg-7n; Tue, 15 Feb 2022 07:37:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49002) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nJsOY-008V7i-QC
 for samba-technical@lists.samba.org; Tue, 15 Feb 2022 07:37:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=eAHybNXSTrqkWNT6MR7mKlAyGAodau04p7Aih8FJxEY=; b=dMsxww2OB0uXjejqbvrix3Wo89
 Z75AYjoMDbhHRMPA5gMHXjcF/J9i4C0vtBf8JiR/YFPJ3MVvaflVbMIb//op+PV1+fo1jSKwdEdDh
 Jimx6rTQ7FOVmgkzXlEN+Pnd+99kYUTfMKX9Pq/3OtcV2SXjTgRWuLK/q1J5rUty5tAjKX9wVIrek
 rTsBG9mr5A290mVC2TmsRM5XinUdwI5krpTBoLRtzsSW69LxoJmSZzawyu0Mkpk4Z4PZa3/uBbwgc
 +7G2myug3JajS3IG/J2pBrlcGUYPvNGqDRTdfQa/XwvPs+3vhsPlWANRGm+G82aI7cjWJn9onLNmz
 v4Lwt+61kVXMKvHHRTEzcQPoyvtUyr8WL2Fr7Cu/1UBeXTkpvnRFOBUmyC4eAnB2x0KsNdHFcw9Wd
 FJ3HoZ34bMUKgp16fyjH0ueovvnc3prEpNFi6YNuPDq1G74pyJnpAFgfb0sscUbPxPCCE5oppZfYG
 Z3UhVr8KxuGYLWh8I/f818oG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nJsOY-003p3A-8F
 for samba-technical@lists.samba.org; Tue, 15 Feb 2022 07:37:06 +0000
Message-ID: <d4823d25-0706-fc1f-44ca-5b961bd0efbe@samba.org>
Date: Tue, 15 Feb 2022 08:37:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.16] Samba 4.16.0rc3
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

Samba 4.16.0rc3 is scheduled for Tuesday, March 1 2022.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.16
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de
