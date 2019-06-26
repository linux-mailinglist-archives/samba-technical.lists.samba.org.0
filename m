Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C70456759
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jun 2019 13:05:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=gLNLmjFsqtkD28imEqGrUGXGsiQgv0pLJTeGq4ctKEQ=; b=J/Sie+FwGMcSxsoI0eCevGxCgx
	0JcCggxh9qPSrpvznppCzUh93tr91L9eSd4sTgelOjX2J+WZRSW9swBl6m+sQA+lezygl/RZjDw7a
	HDaaY96A2h9Ik/DJVKCKhAGde30uBP1gbSto++/1ZTq0iDFtpNdPNU/OZkrfioLxyR3orhwGSrhwJ
	T0so3SHM5ZqNNgXr5DWIpO4v85MgSTXYv575RF4xWR82Q5scC1Lt4ZL05gkT49JvtC6X0t+loDqKu
	d3OOQo7JdJ+NWxRfLePY/GXMc1PD5JlauOr7EoCO9jZspzvn9RIYeunOQmduhTzcry7HL0RtVw/ea
	kksatR5Q==;
Received: from localhost ([::1]:57490 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hg5jK-001rYE-Ey; Wed, 26 Jun 2019 11:04:46 +0000
Received: from mail.light-speed.de ([85.214.38.116]:39992) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hg5jF-001rY7-BW
 for samba-technical@lists.samba.org; Wed, 26 Jun 2019 11:04:44 +0000
Received: from [172.16.102.195] (unknown [212.93.13.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.light-speed.de (Postfix) with ESMTPSA id 620703D425C6
 for <samba-technical@lists.samba.org>; Wed, 26 Jun 2019 12:53:55 +0200 (CEST)
X-Virus-Status: Clean
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stephan-wolf.org;
 s=mail; t=1561546435;
 bh=xWCwaL8VSx40OPfL4oFJp0R1SW8m7uv6Vcn0pCSnNyk=;
 h=To:From:Subject:Date;
 b=VEmOtRJ4MlDFtCG+XEw+Q1mWBIDbDNEXClGn7r5hsD+Vr9eTRn0jpqEYlE4N644Fx
 QqOLI+mV2Zg1JKw4NC5PMDTCUQczAOS4h1B27xjTXz+4FN0+MAZ41X86aNDPQ3ZTJX
 jXShx9b09AStiUu7iUQKfFRT5y9elP5xybq0LWtA=
To: samba-technical@lists.samba.org
Subject: Domain member dns update not working
Message-ID: <c99b3828-10a0-08bb-5520-69b58b786d42@stephan-wolf.org>
Date: Wed, 26 Jun 2019 12:53:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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
From: "Wolf, Stephan via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Wolf, Stephan" <mail@stephan-wolf.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

We are using samba 4.9 on debian 10 as a domain member in a windows domain.
The debian machine is using DHCP. Even the machine gets a new IP from 
the DHCP server I have to update manually the dns entry by calling

net ads dns register-U <domain_user>
Is there a way to update the dns entry upon smbd is started? I know 
there is a way to do it as a DC but we are a domain member.

#> cat /etc/debian_version
10.0

#> smbcontrol --version
Version 4.9.5-Debian


Thx a lot,
Stephan

