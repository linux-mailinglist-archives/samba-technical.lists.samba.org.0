Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 889671BF5B3
	for <lists+samba-technical@lfdr.de>; Thu, 30 Apr 2020 12:39:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=O8qiF2YFrR4267ehOiv37dVMGEENfyPiB77A53Tr1OI=; b=m/7eincyEcPeouwpMgQ03/TKTi
	+RIzTZYob+0UMnGfupy0cs1XjHeOAp6drqShkRdviHmycGLMsgaQimh0+jNDc0CXyrx5UDYhox/2L
	7/IqkOhL0jY+3ibcyFmGEWkEWv69ijCTss0IFrmUiPz/HrbUmhIXjU5rHTK8sdF4T9hgdze6mzSfX
	32J5vYUxUdInW9vJKpkipE7Fz06Z2JVXVX0t0lo7/EwxqIAbaLoG0kRNqyB0LYlXzWrijsULZW2c8
	/dctZHSX/a8C+RSF+HZ6QxpXOApO2eM42t+fyvnWUuaRsqaaJXpkogPRB8n4zPjlKdf65v7li42hf
	+ky+3jfg==;
Received: from localhost ([::1]:32238 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jU6bG-000Acb-9I; Thu, 30 Apr 2020 10:39:26 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:52975) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jU6b9-000AcU-1P
 for samba-technical@lists.samba.org; Thu, 30 Apr 2020 10:39:21 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 id 1jU6b8-00062C-La; Thu, 30 Apr 2020 12:39:18 +0200
Received: by intern.sernet.de
 id 1jU6b8-0004tm-Gu; Thu, 30 Apr 2020 12:39:18 +0200
To: Rowland penny <rpenny@samba.org>, samba-technical@lists.samba.org
References: <20170324092636.316bd8fd@devstation.samdom.example.com>
 <1490566775.13579.257.camel@samba.org>
 <20170327082840.6a00bc45@devstation.samdom.example.com>
 <20170329130458.GB7532@sernet.de>
 <c542e524-c576-5af4-5315-fa8e253a9180@sernet.de>
 <0852b07d-1820-c037-8438-231138bd07bd@samba.org>
Organization: SerNet GmbH
Subject: Re: [PATCH] Remove 'samba-tool user add'
Message-ID: <6c3e5a75-55e0-7206-ea5c-89b8b48308d5@sernet.de>
Date: Thu, 30 Apr 2020 12:38:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0852b07d-1820-c037-8438-231138bd07bd@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: =?utf-8?q?Bj=C3=B6rn_Baumbach_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Bj=c3=b6rn_Baumbach?= <bb@sernet.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thank you for your comment, Rowland.

On 4/30/20 12:24 PM, Rowland penny via samba-technical wrote:
> The problem with '1' is that there  will undoubtedly be scripts out
> there that use 'group add', so you will have to deprecate 'group add'
> then remove it at a later date and just look at how long it has taken to
> remove 'user add'.

Yes, my plan for '1' is to add the "group create", deprecate the "group
add" and remove the "group add" later. I've just skipped this
intermediate step in my description.

Best regards,
Björn

-- 
SerNet GmbH, Bahnhofsallee 1b, 37081 Göttingen
phone: 0551-370000-0, mailto:kontakt@sernet.de
Gesch.F.: Dr. Johannes Loxen und Reinhild Jung
AG Göttingen: HR-B 2816 - http://www.sernet.de

Samba eXPerience 2020 - online edition!
sponsored by Google, Microsoft & SerNet
May 26th-28th 2020, https://sambaXP.org

