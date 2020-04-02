Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 302DD19BEFD
	for <lists+samba-technical@lfdr.de>; Thu,  2 Apr 2020 11:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=5JA8GH4wsKb+v/EB1XDBUdD+EKXhvm/Q9tlysXLkcI4=; b=yAv4oXB6V5+lsTdza5JxnU51QC
	Xpf3JEQwYEEsj7wKWNAhtxF12LG7+HqnPwXjLjSsjayfutubJy+gsXkTEO/oLJmybnps/8yw04yWv
	W/m8dhigEjBQPwrF/X9qHCiHnTeTXFYMBu88spcRT++BR1IMpt1GIFrfp/INCNhmGw2dYM7PWj7oQ
	YggzEnwjCb3nJKeu52LF1/OQ9Ckize0m+ZLLCeuYVlZERplulpJlfofTNFFyYYAB1ZCNrbfK0n9c1
	PnRHgYYv3GNkNvhaJeNKRU491lU98HxApz6Z5Khm2wx8phuMVq4F8LsyfqpVdp/iFQdT5ObPwBJMc
	OmfxV1bQ==;
Received: from localhost ([::1]:62712 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJwcc-0035pn-QJ; Thu, 02 Apr 2020 09:58:50 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:59405) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJwcX-0035pg-8J
 for samba-technical@lists.samba.org; Thu, 02 Apr 2020 09:58:47 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 id 1jJwcW-0001Mu-PA; Thu, 02 Apr 2020 11:58:44 +0200
Received: by intern.sernet.de
 id 1jJwcW-0008UP-Kj; Thu, 02 Apr 2020 11:58:44 +0200
To: Rowland penny <rpenny@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <0acb2828-a298-4a79-421d-683a771d9a93@samba.org>
Organization: SerNet GmbH
Subject: Re: [PATCH] samba-tool group show
Message-ID: <9a67100a-d672-5765-227e-641ced43e683@sernet.de>
Date: Thu, 2 Apr 2020 11:58:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0acb2828-a298-4a79-421d-683a771d9a93@samba.org>
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

Hi Rowland,

On 4/2/20 10:44 AM, Rowland penny via samba-technical wrote:
> Hi, <samba-tool group show 'groupname'> will only show the groups info
> if it is a global security group.
> 
> The attached patch fixes this.
> 
> See bug: https://bugzilla.samba.org/show_bug.cgi?id=14335

Thank you for fixing this!
I wonder about the use of "objectCategory=group". I would expect the use
of "objectClass=group" instead. But I tried the patch and it works - I
did not try to understand why, yet. The objectCategory looks like
"objectCategory: CN=Group,CN=Schema,CN=Configuration,..."
I checked the samba-tool code and see that we typically use the
objectClass attribute.
Is there a special reason for the use of "objectCategory"?

If "objectClass" is also fine, I would adapt the patch, add my RB and
push it.

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

