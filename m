Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BA7575D30
	for <lists+samba-technical@lfdr.de>; Fri, 15 Jul 2022 10:19:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=qDPYXyNOx1Rz/Fyd5IC3ros+G53XXVWREceoZIrWkZ8=; b=r+JCmxBC8j4f393zfnUAlieIm4
	DOhmqXo1oL3FyfLVRY2afM7K/INfaGdODnKnZKywv0cXsEuhjF1c9s6A0vQFJg9rqCr8f2W4GNCVc
	aXgSoS/PbzkY0T+TOmODMC805wu3U3J45dZwE1wbJPcf/JDeT20yF3yJZdq8usqWscGQAFYqPj1TJ
	RvM5szq+67laEw3J0ztYFtl8PFEfUrqzBtXpPmG1AEG9k+4LfzD1y8+FliovakjB247IVnMGWnGJ5
	ejRi3hRg6yYCaQviZEATG5hRpctnUwiRW8av0F6fC1WoNZFIekZDyU3A3Fnf6pDcTb5QwNHE6dEKl
	kdBKe87g==;
Received: from ip6-localhost ([::1]:26336 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oCGWi-000DYo-Dl; Fri, 15 Jul 2022 08:18:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34818) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oCGWc-000DYf-NN
 for samba-technical@lists.samba.org; Fri, 15 Jul 2022 08:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=gOeIQPZ+bpZJ1OMgMwoFQOxsv7kN/iksSi4zMr5QDBM=; b=PxwBqDvKIhvLmzQ71+ZFn6iZJ7
 zR7T22y1uBrTtnMZAIduJjGT8ksLdWa5lToQTYC50S2ri7nhI8+Ls12oCI5OKb2ocKVe/NFld2Hgu
 3OkmUBr8+PoCzqUNKpyixA0oPVEy1RZHy/jW53ZVcHTl226DCoHAETRiZffB6CClzVmgK1lH1PGlU
 ysxMxb3+0lxhz0l3ybL3WGVPVYsn+nstFxATIiW+wfrX13cGaEgvnE0BD1RnJl6bPqRHbt3TxHy7l
 rFK60XqcOg57sce2Ui537yg/sUW/BIF/udGJjPSy90Toze9e+Ax9aJ6oOk5ijHc57m890fyniki8r
 j+JU4k+g24IxtB+4GdrmFFNk+/vz5v8C5pX7xd7fS6fgf/ZZAhmkiXhBU+hI7y+KaL6qU5Htf6deG
 3Erm27KIeNlen+KBK56ZpVOof2xqzsbs8QG2zksoYgFMMxzwelkVoU40cJZ6IgaKDSGxmoet5OwWq
 Dq9xANQerMiH6PCUlOUIJV6D;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oCGWb-004qzD-Qi
 for samba-technical@lists.samba.org; Fri, 15 Jul 2022 08:18:13 +0000
Message-ID: <4611531a-4154-6b08-1d9f-4add64bd2f99@samba.org>
Date: Fri, 15 Jul 2022 10:18:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.16] Samba 4.16.3
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

the 4.16.3 release will be brought forward to Monday, July 18.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.16
has been updated accordingly.

Cheers,
Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de
