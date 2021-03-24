Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 818963481F8
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 20:31:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Mh4xDcbesen/uD6NwLUhFFa0XbiK1Htntj04ryVNK3Y=; b=KP0KDu8G9PZSPKIoiP/O6DOEWf
	s4QZ6eGfSM/TJGsCM86JBYtnZTtGk/a9fLYAM44hcJCrG3LlB/gTIL6e0qeoSfYtQbORsN2TsuM5w
	M3C9HET0Y3GdeJN9wkCWDJH3c54YNwaJw+6LXS9mEARVxSYZBzzC7wVa2gJgDC6mC/Mb3SF3dxhh6
	S1K6LMgIsQrYRe8XoiKdGqHuCsWyqcEOQ5ftBVw91/jVWiCaOsL+H5BgaOEw1eHSFidV8RZ5y86np
	ZOw3C3dUnZY9OLwE1yQyPLX/wbi29FXpD9sJqPiyR6y3ov6NcYnbKPWjoYXysSzPpE1xobkBbBYnW
	sNOn6y6A==;
Received: from ip6-localhost ([::1]:46064 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lP9Ci-006dYL-Ff; Wed, 24 Mar 2021 19:30:08 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55726
 helo=mx0a-001b2d01.pphosted.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lP9Cc-006dYE-MR
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 19:30:05 +0000
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12OJ2b7F037110
 for <samba-technical@lists.samba.org>; Wed, 24 Mar 2021 15:03:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version : subject :
 to : from : date : content-type : message-id; s=pp1;
 bh=s4eYYJATERDcm78eMMNmo7rhgBwMjIt9i4etP4eNtSY=;
 b=LnSKmRAaBZyukuPq/vXD4hVA7CJ+Sfx7DnP7XnCrzG5F/xFnDn6gLzo2yEucgVnmWmLi
 5b/i7OlTm3LSL0pwv1RA3ajegbGnaQ1BC7rjFW/prYP1TBUPbK5S42ASeXYUIVHUv5Tl
 pkH2/1g6bZWXBI+RuaYrf6OsKjFhD1YjZ1guTl66WhXyDXIwmGdbpfqyrv0cgl3b4fYF
 lsavYB2gEjinVkQeUuxc0Hy8o5YW0dRuINzK8bjKlsytCphWr8PFwdParFbE6XQ+l1j9
 mfckmGcii29wrOdua+0Wrr++GVEREmHHrhmCCuren6FcVOlcmm8hzoXDg9rzbnWRMB71 GA== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37g8t0m5r1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Wed, 24 Mar 2021 15:03:27 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <samba-technical@lists.samba.org> from <jpjanosi@us.ibm.com>;
 Wed, 24 Mar 2021 19:03:27 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 24 Mar 2021 19:03:26 -0000
Received: from us1a3-mail245.a3.dal06.isc4sb.com ([10.146.127.231])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2021032419032597-688411 ;
 Wed, 24 Mar 2021 19:03:25 +0000 
MIME-Version: 1.0
Subject: Samba AFS Integration Support
To: samba-technical@lists.samba.org
Date: Wed, 24 Mar 2021 13:03:23 -0600
X-KeepSent: 02C457C2:057824D7-002586A2:00688BB0;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP7 Octobe4, 2013
X-LLNOutbound: False
X-Disclaimed: 63051
X-TNEFEvaluated: 1
x-cbid: 21032419-4409-0000-0000-000004D78328
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0;
 ST=0; TS=0; UL=0; ISC=; MB=0.000018
X-IBM-SpamModules-Versions: BY=3.00014888; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01521490; UDB=6.00822281; IPR=6.01304004; 
 MB=3.00036428; MTD=3.00000008; XFM=3.00000015; UTC=2021-03-24 19:03:26
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-12 19:12:50 - 6.00012368
x-cbparentid: 21032419-4410-0000-0000-0000A776853A
Message-Id: <OF02C457C2.057824D7-ON002586A2.00688BB0-862586A2.0068AE6E@notes.na.collabserv.com>
X-Proofpoint-Spam-Reason: orgsafe
X-Warn: EHLO/HELO not verified: Remote host 148.163.158.5
 (mx0b-001b2d01.pphosted.com) incorrectly presented itself as
 mx0a-001b2d01.pphosted.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
From: John P Janosik via samba-technical <samba-technical@lists.samba.org>
Reply-To: John P Janosik <jpjanosi@us.ibm.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



Hello,

I saw the discussions about dropping some code in Samba 4.15 and the old
AFS support included by --with-fake-kaserver came to mind.  That code
requires AFS to be configured to use single DES Kerberos service principal
keys so we stopped using it a while back in IBM run AFS cells that I know
of.  I have thought about updating Samba to support modern encryption types
for AFS service principal keys but haven't found time in the last few years
so probably will never get to it.

Regards,

John Janosik
jpjanosi@us.ibm.com
