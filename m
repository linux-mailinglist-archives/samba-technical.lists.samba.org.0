Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BCB781AC0
	for <lists+samba-technical@lfdr.de>; Sat, 19 Aug 2023 20:07:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=u0iKvVL+W+B9Bq7SLOgIxPI/tAbfK/PwQcTNhpMzVWQ=; b=szQSCVmc6xGXDqzoeQzHGafY+X
	CGuWYNhqoYJVBYaSkA9rhNCcxECdz8nE79sEukJS0PGvQxSSzfv6nO6PwfupOjsW9Spo0seXj6HuR
	pfyYi3xa7R/TQtrftEVMYnD2TyOnFQVgx9JchP4K0Y+W4mDqkOwdosiYxlPD/IU1nRCXYWygJDLko
	qXlONz4jzoe0fVVyAY0M4d7kHcmxWLKQ/FjSAugVXIXd4FuqDlPZjNN6zdTFPEo+Ux66NO6QsofJU
	xOXsazFlUAtE6PLhgAbyD2/VH/Lh+2WsCAqU2df8x4TZSzADwmNOk1lIxDhCafKNghLBQSijKxT5b
	UI7WJBKw==;
Received: from ip6-localhost ([::1]:51626 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qXQLW-00DKpA-0u; Sat, 19 Aug 2023 18:06:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22336) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qXQLM-00DKp1-5P
 for samba-technical@lists.samba.org; Sat, 19 Aug 2023 18:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=u0iKvVL+W+B9Bq7SLOgIxPI/tAbfK/PwQcTNhpMzVWQ=; b=p5MEvLS2rIKTccYRYxdhHfy8Ph
 RljE1Y01ldNu8maZFFjoBX5WEi3j3odr8rI976Q6KtnAJFRrEDO0i23FVLd/uwIgheWJoUL1o5gTu
 /QT5qN5GTFjLt5CYNzsysdNBFvvmavWBgwr+/uJclub3s7+GvIusVxWMHitu9BOzS1NPoZ3FZ8dM9
 jJKTx73ArE6JSAmTAh5Bsy4AZb3933DbJpEIhe0pFuvIKMP7XDXs5KqndexF9kgbfm52YtMzj/B7m
 dGxjL6fuD6+m/wLbZnn9jc0pF/b/bETHvaOilzWWhy8RQD5GzYRiVF0vgBYXq/cx20q+MsMJQLg0w
 d517Jz6SGl/5Yidqg/8uYhPwS72Kt1g8DYyECI1ADVbR91WcO+D4Q03YktpZHX0rEJ4o7qpwIAIB/
 KUiZHbKLe8vrSyr/Xlf1OwkjEJHLNRtA+i9huk20ttOCr3ql6XJoCkcdvL481ewLxMXbHCNTKriJZ
 7sxXPTBS74AnCAnvKpBzX6W5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qXQLJ-008vBK-12; Sat, 19 Aug 2023 18:06:33 +0000
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Subject: Re: Drop RHEL 7 / CentOS 7 support and move to Python 3.8 minimum?
Date: Sat, 19 Aug 2023 20:06:32 +0200
Message-ID: <14854277.O9o76ZdvQC@krikkit>
In-Reply-To: <c1da83c30cca9c9e0d85fa6b1dbdd52e014ca918.camel@samba.org>
References: <6725d25bf9dbbfebd0b1ad248fc6b397f89165c8.camel@samba.org>
 <4db84791-6dbc-4f8e-f1d7-7582451d19c4@catalyst.net.nz>
 <c1da83c30cca9c9e0d85fa6b1dbdd52e014ca918.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 18 August 2023 02:08:00 CEST Andrew Bartlett via samba-technical 
wrote:
> I would note that times when we didn't line up the CI version and
> Python 'supported' version, it kept breaking.
> I note that RHEL7 ends 'maintenance' in June 2024, just after the 4.20
> release March 2024
> https://www.redhat.com/en/blog/end-maintenance-red-hat-enterprise-linux-7-al
> most-here Those dates I think give good cause to drop CentOS 7, but other
> views still welcome.

I'm fine with dropping Python 3.6 support for Samba 4.20.


	Andreas



