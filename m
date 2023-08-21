Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E9F782361
	for <lists+samba-technical@lfdr.de>; Mon, 21 Aug 2023 08:04:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=+44RoJhxu9CLFPyGVlh+rGIJT+AVFHymowQbDjUnCt4=; b=zfn+dD47btAT1bPPfpnZ1Lv47G
	F0n52+cRYLWUnNmc93lhwCjKM04pv3sSK/8xH5c3WYa+SZ2qroNpnO62oYZufvUVNlHDMQPcSnxCV
	TAGDz3lsrgkjDIEXyI/YDEwZQ04yEZZaT6+RIMwJFZdRpwy8V36hmlwE+63CH/zGliSwvCUeQszBo
	CyzEbvyLjjWBr6tElv1U1L/TbvdlHJJtgNi1gEp6Rrw0MDOSrfnC4XVEhPeue7zc43YE4uFJZhmc4
	R9KWTd8jqz1d4+h2fRsvbEFNgeSgpkrZgLCma++cW72oAKxY93zBdtusTEvY2FYjX9TMRJMcwOoFS
	Y2gIyAIA==;
Received: from ip6-localhost ([::1]:39012 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qXy1o-00DZCu-HN; Mon, 21 Aug 2023 06:04:40 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:55547) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qXy1j-00DZCl-6o
 for samba-technical@lists.samba.org; Mon, 21 Aug 2023 06:04:38 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id B14061B9EE;
 Mon, 21 Aug 2023 09:04:43 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1959F20915;
 Mon, 21 Aug 2023 09:04:29 +0300 (MSK)
Message-ID: <15345bf3-9d57-af3b-1926-8fc2fd2cd130@tls.msk.ru>
Date: Mon, 21 Aug 2023 09:04:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Drop RHEL 7 / CentOS 7 support and move to Python 3.8 minimum?
Content-Language: en-US
To: Pavel Kalugin <PKalugin@inno.tech>, samba-technical@lists.samba.org
References: <6725d25bf9dbbfebd0b1ad248fc6b397f89165c8.camel@samba.org>
 <4db84791-6dbc-4f8e-f1d7-7582451d19c4@catalyst.net.nz>
 <c1da83c30cca9c9e0d85fa6b1dbdd52e014ca918.camel@samba.org>
 <14854277.O9o76ZdvQC@krikkit>
 <62eadda8-c6d3-4086-8f64-c37a33824fa0@inno.tech>
In-Reply-To: <62eadda8-c6d3-4086-8f64-c37a33824fa0@inno.tech>
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

21.08.2023 08:48, Pavel Kalugin via samba-technical wrote:
..
>> I'm fine with dropping Python 3.6 support for Samba 4.20.
> 
> How will this affect OpenSUSE Leap users, where official python3 is still python3.6?

Does Leap have recent enough gnutls?

/mjt

