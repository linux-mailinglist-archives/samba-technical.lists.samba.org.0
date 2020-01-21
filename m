Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6C4143957
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2020 10:19:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Mvmkap3PzF1g+EiyziwrWTp7xKlOYjVcoltHVh1DxHw=; b=3Fc1GPByIW2LGaGUPP6aNX/Ugs
	DfekWdr1l8n0ZiycQfmbt5H9sWsqTYHcd5uvrf+97Lg31S/M9KjnafOvJJdNbMx5dwvhDy6cPmz02
	Q7sEx8nEtu6se1IrbTkepyT1v/xtoi9KxDonckdMqDe6qpHR8a3XUfrU8O1+1f9LFnJ8GZffKVZ9T
	bWOppRlu9BYvIHrToZ489lxCZO0mZ508ueCOeZhzD9l5uhjiKGz2n+adMGVrkKxeTx8596wYZbt23
	K6PxRkly+U/JZ3X35UQdQ22z1Mwy1XjGp+FIkv8evxzZhupZl/bg15ywgKlhwqAxE4wbCFXC5brRn
	zFAdq8UQ==;
Received: from localhost ([::1]:48356 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itpgS-003zV9-7k; Tue, 21 Jan 2020 09:18:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38532) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itpgK-003zUx-NV
 for samba-technical@lists.samba.org; Tue, 21 Jan 2020 09:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=zKp5u4tkGPeo04Y1AELh0DjVaFuhqlr7O/DKDmD87Pg=; b=Q5I1jpTVTByx+ylmLIja6XrzDB
 DODOvJgdta4XopWwRNiGmeiqy4mDiC8+XLpkEHqJXGIlkAtwTOA5XNv0Uq8sAuLwqvL1tcvXkl7V1
 j1p9C0g0boUO8xHJnpBGTKTIitfAnkcYF4iyra4peNtfY4ZofWMKNtU/gTni1PiEUb/Lxwm9fGjYV
 Mmpf/2Yp/f34LKn6CBJapHQNn6WImrK7OwvFFFjKEwpy28NyhfLkETlIBDMhtFJWSKpwISaTyInLU
 UQFHK6t2ZFHmZluvUKs4+LvwjtcTwMIg9pXTx9tlIlAw+fVCRC2FV6Sl1NTDK4M7uQ/02f+ng+UuM
 iAi54DeV6EtvbUKhKHiExIQqwhobKokXbVtxcR//r3Y0f08pnr7zVN56xvL6wwnB2jKapmUy8+/eV
 yWTnQLi59tD1sS3ziiI1nWYcOwuW5wf1xiCvrSlBF7Hjn6+C5E9T4ohnbK7LMb/Na2hzstM1Eaz2e
 DxVn3+WQipuKvf9IX0DCiBr8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itpgK-0007vb-6c
 for samba-technical@lists.samba.org; Tue, 21 Jan 2020 09:18:44 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1itpgK-00GEiW-0a
 for samba-technical@lists.samba.org; Tue, 21 Jan 2020 09:18:44 +0000
MIME-Version: 1.0
Subject: Re: Update gpo.py
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-123@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-123@samba.org>
Date: Tue, 21 Jan 2020 09:18:44 +0000
Message-Id: <E1itpgK-00GEiW-0a@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

TmV3IGNvbW1lbnQgYnkgbGF1c3NlciBvbiBTYW1iYSBHaXRodWIgcmVwb3NpdG9yeQoKaHR0cHM6
Ly9naXRodWIuY29tL3NhbWJhLXRlYW0vc2FtYmEvcHVsbC8xMjMjaXNzdWVjb21tZW50LTU3NjU5
MDQwMQpDb21tZW50OgpPaCwgc3VycHJpc2UhIEkgaGFkIGZvcmdvdHRlbiB0byByZXNwb25kIDot
KQo=
