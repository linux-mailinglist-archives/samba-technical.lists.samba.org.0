Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2472140468F
	for <lists+samba-technical@lfdr.de>; Thu,  9 Sep 2021 09:55:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=FqeTsHTH8kC6YLUA2EN+fm4hBKNnTJz8FtWC+c4zxSo=; b=hNEoXpyAJIiZmd07m32swlC4lS
	NuQKs2tpVLFjZKImAcZ4XlGZTbachB+d/QSfbX0CoRhz5Ivec4Zi1JdmVe99Qkybbq0WVG4bQ3cgJ
	AXFng0mKnY5+E+UvjQVhVMZQ7kk7Z6Vw98BDD6g1F3i986j0GiwFHO8EFhFEaQnTeUaws8mv8PLW4
	p9balBAn5xKOtlVi0IRRXThtNAoAoiCRiWEz70uPytOwroz7Mp+XLUudO5WAcvGFWyE1AzyWSOnG/
	4MZCigjB9sdvjc/Cz66tA2/gyUXN2+cjf7SmvvcbYW1WAP6e209yEvJ3T2M7HShu4E/IES2Wd+2cV
	HmVZ/dQQ==;
Received: from ip6-localhost ([::1]:65374 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mOEtg-00E1lR-VW; Thu, 09 Sep 2021 07:55:01 +0000
Received: from mail.briosix.org ([188.164.129.154]:42248) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mOEtb-00E1lI-Ll
 for samba-technical@lists.samba.org; Thu, 09 Sep 2021 07:54:57 +0000
Subject: Re: AW: Suitable replacement of OpenLDAP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=briosix.org; s=default;
 t=1631173085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FqeTsHTH8kC6YLUA2EN+fm4hBKNnTJz8FtWC+c4zxSo=;
 b=CYf9cROEEkVBLeBntHwiPwlFnsUzbpIUTCqev2iyMcmN5bijq0U5E6mSnMOAhBzHmngZ2g
 vddL4bSBWjChqFASz0ijla6DGzgcXue24jkSRoKEmzJ741PaBIKBXPYPw3zZTH5uGA7yG7
 6bH0NsSj4JLjVJoHqMTGzNI76eW9oOM5MzVTP2O51zCTG9PohslUxdVgpyGOK5olj9X6MU
 FL3q4OzjTYiPkNZc+jlS3jCJ/gvAPuEeJWkR9lo+72DNg8uW7iO5yeGj8a/hP6xle8soBD
 4G63vHOKamvZSlKSZziLx1ijE28ujDaue8eNEjjjY5HPodIAXttEU8ipZONZlw==
To: samba-technical@lists.samba.org
References: <4B4EA55EA622814FB935316CC68B2DFC4B114E@MS-EXMB.mikservices.local>
 <4b1807f6215c6842b39e752f3978b1926eb16896.camel@samba.org>
 <4B4EA55EA622814FB935316CC68B2DFC4B11A0@MS-EXMB.mikservices.local>
Message-ID: <c6529633-6dd5-81e5-b223-f5fd62d5321e@briosix.org>
Date: Thu, 9 Sep 2021 09:38:05 +0200
MIME-Version: 1.0
In-Reply-To: <4B4EA55EA622814FB935316CC68B2DFC4B11A0@MS-EXMB.mikservices.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
From: Alessandro Briosi via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alessandro Briosi <tsdogs@briosix.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi all, just bouncing in the discussion to add my 2c of 
knowledge/understanding.

Basically you are simply using samba as a way to upload files to the 
server where the application is running.

To do this the configuration has been using Samba with OpenLDAP as Users 
backend, but it isn't directly connected to the application (beside 
using a link inside the home directory of every created user).

So when you add a user you do 2 things:
1. create the user in OpenLdap (so it creates a home directory) for Samba
2. Create the same user in your application and point the home directory 
for document imports

Now you might have 2 kind of situations:
1. The application is running on the same server and there is only 1 
server for every installation (which seems to me your requirement)
The solution would simply drop the usage of OpenLDAP and use Samba in a 
standalone environment (creating users directly in Linux and adding them 
to samba)

2. You need to have the same user access more servers
The solution would be to setup an AD for the users (possibly a VM to do 
just that) so it serves the users to all the other hosts, and then 
simply join all the SAMBA servers to the Created AD domain.

The process would be basically same as now, create the samba user and 
then in application in both situations.

Just to clarify:
OpenLDAP is a generic Directory Service which was an option to provide 
users to Samba in an NT1 Style domain.
SMB: is the protocol for sharing/transferring files used by MS (in 
various versions SMBv1, now deprecated, SMBv2 and SMBv3).

SAMBA: implements internally the Directory Services to mimic the Active 
Directory service by Microsoft which deviated from the standard LDAP 
protocol specifications.

Samba now is more than just the implementation of the SMB protocol (file 
sharing/transfer to be simple).

Hope it's clear and it helps you solve your problem.

Alessandro



