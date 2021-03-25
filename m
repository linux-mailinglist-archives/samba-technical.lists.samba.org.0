Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB3C348616
	for <lists+samba-technical@lfdr.de>; Thu, 25 Mar 2021 01:52:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=qi13CFo+6T9nkAYEUCxUrb6kzBHGPWbx5XbjkeUH/LA=; b=T8j3/OwPt3LEdFLUM83fYxoZu0
	pOcnafhBlNeh+dV9hbAj9DIp+ST9UvLRzwrDOFCKEUbSasdWn8jIYWFOW7MXZZBsEhutZRqyiKgvq
	+Y2HJUbc9W2YgabNPV+Hi3keQZc0LN0wP4f+/NU7E69FMfndY5+B8Tc8y1PNHFKVTUr7/+qc7xmLA
	IFbmALSMEm8f8csYiSt/NL6kQdwFCOIpH5p0mlf7eYwrvWRs4gWjl0BLV6pJ6xD5BqKS3VaP/XuIt
	945eV6Wlo5cM0WfdXzb6utqp9+YOSwN5kvy8Siqzo1ipX9o2Qod6xunl0Fb23rpqy0nEjUVzEMGNq
	dCao8YFw==;
Received: from ip6-localhost ([::1]:63316 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lPEDj-006gDW-CK; Thu, 25 Mar 2021 00:51:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45090) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPEDY-006gDO-3G
 for samba-technical@lists.samba.org; Thu, 25 Mar 2021 00:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=qi13CFo+6T9nkAYEUCxUrb6kzBHGPWbx5XbjkeUH/LA=; b=Fmf2fZloyt+bsIkdqqZ7DWT5Ms
 CJDGHZAC0cPMT6zniYH2qtBpehuley7dzLNvQ/GwNsWXjoDRaEiYL+OW3qwvLus9oHLiwW3IjQT5t
 j1/ytCYI7LAasfh4iQvwN0KroP3/X6wIjxEgJReVBfgbGBu9XwI2w35UtfpNMByOjVH+0KFA6kRNV
 xHDu0mbRf/LEGOnLYhH4ze9GS0UK2RHlWg1bENM8hyhKJPbhCVpHVT/DqJagdrw5aEIpKdfHho8BE
 YIqoXxYovwL4yaZqQhiImq2CWy6rFY7kFCn0OW2V0rYuZ7k0oi0kjMETak/uXmzZnMT6t8iDcXAjr
 dnatycpQcmp5blIs8LvAHId6khOVZYBtB/9wSfXj22v5msWpREMkgcPR8DmKnxE1+xeEQDoM/BVAQ
 ghLmwviqV4jqM0RU2S2lA8WTeyTwFYwbssywTXSZTHKJTTDHd4qngzrefADheP+97Dwl4CEBIe6fP
 AHYebrJo36nbLV4G/DkJf0w6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPEDM-0001o4-OS
 for samba-technical@lists.samba.org; Thu, 25 Mar 2021 00:51:09 +0000
Message-ID: <167d230b2584e0fbcd7bfdf8e6e4314154ef4ec4.camel@samba.org>
Subject: Drop LM password support?
To: samba-technical@lists.samba.org
Date: Thu, 25 Mar 2021 13:51:04 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thinking of things to drop from Samba, I would like to drop LM password
support, at least from the AD DC.

We have already deprecated the option, and LanMan authentication on the
AD DC just makes no sense at all, but I've seen configurations with it
enabled (where folks turn everything on hoping things might start
working).

For the file server it is a bit less clear-cut, but I wonder if it is
better for DOS/Win9X clients (without the NTLMv2 upgrade) to do IP
based authentication and guest access rather than this.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






