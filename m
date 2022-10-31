Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B63356132A2
	for <lists+samba-technical@lfdr.de>; Mon, 31 Oct 2022 10:22:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=7m3gdx/2Lu7mUhIfm2w5/q5VESf+MuEDLSTW39uyL+o=; b=Nk+MHKOfNBknvY5NAQFTTGWXP8
	zEjMlyuuDLCGAnBsYYayCIdin4ZGiY6KJEY+5EDE7JB65wfgrjs4BBN9mm+zR7LUqa6bQSF5mooVW
	+9ZAw1GBuPpd03owkkZ2reTz3zqkqOA8rIpqqkxvVK57eB4nxofuXgwRiV0iChXqbMSRb032wOQHe
	KPl59mlqwjgB1n6eooB+JBburbr1W+frCxfyvDcWiF+GmuK4F5DqrYmAe4eJ+L9eSTxiGuDllhKee
	hmFCXwcnFPIy+e60M3kp+Ari+Y47q+rqLJ3H/z+o6Kc+RWQxRE0r5VNlCoCx9o39y/+KFaNiqktI4
	uZeqPNCQ==;
Received: from ip6-localhost ([::1]:58344 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1opQzl-007SN9-3O; Mon, 31 Oct 2022 09:22:13 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:51327) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1opQzf-007SN0-Rg
 for samba-technical@lists.samba.org; Mon, 31 Oct 2022 09:22:09 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 70610403EE
 for <samba-technical@lists.samba.org>; Mon, 31 Oct 2022 12:22:05 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 62BB013A
 for <samba-technical@lists.samba.org>; Mon, 31 Oct 2022 12:22:09 +0300 (MSK)
Message-ID: <13f38497-ad24-254f-68d8-0a3c66da04c0@msgid.tls.msk.ru>
Date: Mon, 31 Oct 2022 12:22:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: omitting SONAMEs for plugins?
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

Hi!

What's different between a shared library and a plugin is that
a plugin does not have a SONAME, while a library should have
one.

When samba is built, SONAME is added to all shared objects, be
it a library or a plugin.

I'm not familiar with waf (and with python) enough to understand
how the final link command is constructed, the thing is quite
a bit complicated there, with multiple layers and multiple
operating systems and linkers support.

Is there a way to omit the SONAME field for plugins?

Thanks!

/mjt

