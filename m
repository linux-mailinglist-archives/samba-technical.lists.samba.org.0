Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA99CA25E1C
	for <lists+samba-technical@lfdr.de>; Mon,  3 Feb 2025 16:13:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=HIJsdozgPwdtxm7l08YgW/8/D60sHhkslbairMoFVww=; b=rZlrJTzZUf/1c5T/Hh/7rbCY9z
	mJzd/CS/fzJCzE3q9liHWGgXv+9SpnpN6fW89jOBfs4EnQy40pQ3fk2LvqmI0XDpFpMZD2kWy31kR
	ytFvi43uNf4m8GGib0TCo+QFCxTk1jfF/ahdsXoQVdpvyh7ahJO6Kjit0NguOT2PDejGYglT+x9Pc
	jTbivXo3Roqip9oKhEA18bAPDjjPHa/5csFkcv/jC7T8gDFAIqBrwU0iqV0H0XOpu90tFqZc31H6M
	J5rd0hSzqq1hdCg5bVmDnL/7ZgJ9Qz3zJ8hlSYeHf45GVFh61vObJX8xqheVz45sM8IxXtDRTNQ3k
	aMqlnF2A==;
Received: from ip6-localhost ([::1]:65080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tey85-00BkS4-2u; Mon, 03 Feb 2025 15:12:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62042) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tey80-00BkRx-9r
 for samba-technical@lists.samba.org; Mon, 03 Feb 2025 15:12:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=HIJsdozgPwdtxm7l08YgW/8/D60sHhkslbairMoFVww=; b=W+UYfWjm8IFh/5s3/XGCVSUPhq
 mnI1kLmo10BYzUPIYV0ZBTHvjk9iUSQkWY9ec2kH1AQS4EW+txFbUb/MeMIGeS4sx2Rvv2ojDLjjH
 cNqsJBVrP1Cu29lRi1obGcGB61nazic+HEJR7oQ8WmZA3qr3H02DMY+t6JEk/AvkiTWe7De3fSSg1
 6B2lrvsvwp4HnruUsz8lPJD1prwt2suzrvvFs/tnLgb9ga0mltOnXTZB1iyROHD3TmEvtfPkTs23C
 vNxDeGS6WkqLBzcUdzW7j4BjxpssLhsD1VCFMM1BgKZ5hVslAZD4Ap1ZLw7ZXI4vSxatrrACfB5gq
 I1Ugu/JZo64jX5n0m1J7tCImZ4SxKHErELKuCDhjmW0zscPN+a/63JXODvksopZcaOdK0w8Rb0f79
 pNMfBDmwPPm5lq984syhyTDPS5fUATzmTB6rnYmG2YsKEl/pNIMfUldg5PycmDToim6eDxENNJDuc
 vRP9qgPMy2Rx4yle9PqfGg0E;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tey7z-000vih-1U for samba-technical@lists.samba.org;
 Mon, 03 Feb 2025 15:12:47 +0000
Message-ID: <2c0182dd-8892-423c-b07a-b1ccf6797727@samba.org>
Date: Mon, 3 Feb 2025 16:12:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.22] Samba 4.22.0rc1
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

Samba 4.22.0rc1 is scheduled for Thursday, February 6 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.22
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


