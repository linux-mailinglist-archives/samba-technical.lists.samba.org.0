Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9033296A8
	for <lists+samba-technical@lfdr.de>; Tue,  2 Mar 2021 08:40:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=qJVT67X8a71wmnQJLE5ffZSwJ6qEsRDFkoI31AN6YtQ=; b=MobdRwPjz30lg/H9CbrDQld+0J
	NZp4bBW6dq3I2BHObrJyhGU4f/b2fXyNOivb22W+zvVh1YrbC4ps42fAmiIFck/ERQL2YmT6AmtsI
	/usy3egcRcD8+Dc/xCegf9vi+pENP0jeY9oXMAwcUL3bkzLAa/oMlzfaQ5IwpyUKVLYRYRP4QrZnH
	64y0kMTcxgYrOEEPl2JZadO+kMLLGJ+DEm5MGCKVBqu+DTj/Psl8eSNga7NZpzuk4RBmF2Z0ardJk
	XPC1x9tc1QM6mU86eo0BckaJd6wFYFc6XjFXkfb9FBcUnMl/E8g8mknRYufZ5uVlgH1CVwrQyjcXX
	iAxlsekA==;
Received: from ip6-localhost ([::1]:20636 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lGzdS-003pS6-Gu; Tue, 02 Mar 2021 07:40:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48804) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lGzdC-003pRh-DX; Tue, 02 Mar 2021 07:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:To:From:CC;
 bh=qJVT67X8a71wmnQJLE5ffZSwJ6qEsRDFkoI31AN6YtQ=; b=feUr4v2/60OBiajplexq9iusC7
 csrl01RsC2E9uFWVhCDbWhjNv341GReCxhgG7Rk7iZSFLPJ2p+9dhtZm0JkgPDq+7ryYyGnlEIQli
 flCgfVVYiHKxImpiR2Nl3UX+ipQl05AJVY4bindbkyRieJy2pcoXANi8Jq0r/sEvca26h2iZWxQ0I
 K/FY8VU4pEVElxOT8XbA458ep3olEeriWccdNgsvuv3WCf7kp6bzkNquJcOZ8ss3VmpgzXEOFypj5
 0mrYSvd7VUeqGsrpbCX2IcQQ5TPmiRBBDLJnqBF5LJOAEthGLc4qnjcdN5LR1j4lFyp+0vxPXDu3e
 fENFkcu6FTIfl07IQAzKzlvMuU6lDEAzKOb6gxj54RgbsgtZsYqEUtDJTqWwoa3VTJNfZ0uj6Tci/
 GcVOJkhMg264KeUUVd7CvvgXi23eWLCgbGzrbIk7Uaqtpasgew+SrNeGRfuchatcOSWmtxqxv6GaE
 smnyCp7epID8KdVMu6RZw5w+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lGzd6-0003oi-Sj; Tue, 02 Mar 2021 07:39:40 +0000
Subject: SambaXP 2021 / Call for Paper / SMB IO Lab
To: samba-technical@lists.samba.org, samba@lists.samba.org
Organization: Samba Team
Message-ID: <975dd347-70f2-7390-b811-b5afd745c2e7@samba.org>
Date: Tue, 2 Mar 2021 08:39:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

the *International Samba User and Developer Conference
SambaXP 2021* (https://sambaxp.org/) will be a virtual event again.
It will take place from 4th - 7th of May 2021.

There will be a workshop on *Setting up Samba as printserver*, and a
free two-hour workshop on *Integrating SAMBA+ AIX in an existing AD
domain* on Tuesday.

The main conference event will take place from Wednesday to Thursday and
is free of charge again.

The *Call for Paper* will end on March 19th, 2021, so please submit your
talks now! :-)

We are further pleased to announce that a free *SMB Interoperability Lab
(IO Lab)* will take place online from Wednesday to Friday (May 5th 3:00
pm to 7th 9:00 pm) as part of sambaXP. During the lab participants work
together and test, identify and fix bugs in a collaborative setting.

We are looking forward to meet you!

Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de



