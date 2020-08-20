Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8D024B139
	for <lists+samba-technical@lfdr.de>; Thu, 20 Aug 2020 10:42:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:Date:To:cc;
	bh=iJvALPUo+1TN3LEyN91MYv8xlNDOeOV26Axy8975+C4=; b=kUoM9qwJ9oQclppZQItzMV5gKV
	bR//rHKJZORa0IKuIJ9509Y/9hGmwJ42uha2Tei7LgYFWrExNQ3ROghlWI6IpPTve1uNgRsznTSak
	6MXMRnpaxcG+fc7GGOlMK7bO2SwwdpvK29pBAIl7LMnvgsiMfw85q/hyd/otakIxPkGQ+Cee3gWKi
	T/2uY9heX7twUgedaAhq7KlKAwOI+TNaDeqDxN28JaHvD7xuXn3DJC2haOoGB54uTx28j62LPspl2
	qeIvgOqCWZPvUkjFK1Z9De7TysvqZJc6TuSHg8O8pzcGRxu95qbSTfXNY4NDyNv27egvTNAMF1lvP
	MlV3f6Eg==;
Received: from localhost ([::1]:19134 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8g8v-00EOYX-OY; Thu, 20 Aug 2020 08:41:53 +0000
Received: from prawda.net.pl ([91.240.135.250]:28201) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8g8r-00EOYP-0W
 for samba-technical@lists.samba.org; Thu, 20 Aug 2020 08:41:51 +0000
Received: from [91.240.135.247] (helo=KOMPUTER175)
 by prawda.net.pl (prawda.net.pl [91.240.135.250]:465)
 with esmtpsa id 1k8g8o-0009wO-8f (Exim 4.92.1) for
 samba-technical@lists.samba.org
 (return-path <admin@prawda.net.pl>); Thu, 20 Aug 2020 10:41:46 +0200
To: <samba-technical@lists.samba.org>
Date: Thu, 20 Aug 2020 10:41:45 +0200
Message-ID: <!&!AAAAAAAAAAAuAAAAAAAAANGsRTVhQVFCrPuEPBc7FtYBANlTnCJhprtFudq2LHCBs8EBACQA//8AABAAAAAP5o6qqs81QbZAef/IH8MpAQAAAAA=@prawda.net.pl>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdZ2zbQT3SoSbA0wSbeX5tfsmgWTew==
Content-Language: pl
X-SA-Exim-Connect-IP: 91.240.135.247
X-SA-Exim-Mail-From: admin@prawda.net.pl
Subject: Problem with login win10
X-SA-Exim-Version: 4.2
X-SA-Exim-Scanned: Yes (on prawda.net.pl)
Content-Type: text/plain;
	charset="us-ascii"
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
From: GC via samba-technical <samba-technical@lists.samba.org>
Reply-To: admin@prawda.net.pl
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi

I have problem with login in computer with win10. Sometimes when I try login
I get communicate the password entered is incorrect, in samba logs no
errors. I must restart computer and then I can login. 

Sometimes login to computer work and block comuter (win+l), when try
unblock computer i see communicat - the password entered is incorrect.

My samba AD is in version 4.12.6. Users and computer I add in samba ver. 4.8
and last I update it to 4.12.6 and then I see this problems.

Please help me

BR 

GC  

 

