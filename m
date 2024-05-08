Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B07A88C01AC
	for <lists+samba-technical@lfdr.de>; Wed,  8 May 2024 18:07:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=5Fl0ZWe43ajW29HIuORFUyzjHHQBey2u8N6Nblibtco=; b=NM75S3i5wzj3oSHiXFnUnIq7CY
	vHVnFSC2S1sxszOlHAkolw+dPhDAXZuIprHhjS0MwKCxv3jwmws6dGUzeFEFHaDtbcgxTHWvBo1SM
	Wp4Ab7BfD9zGLuehrxFcwK6s2GICcijIxtMG5yN30nMcoMbqUxRyXSBQR4irW+IySdbLmB8y0Db+8
	Jy7N8XB6jklUmwWIUwP5kNZUBumYAwxFkbWRDlO90FCfB73Nvs1XoXlSf59RfCJ0G7zGwmee1KHMV
	MQosDIIx2P0qXNxVJWDTXE55ZPEXUOTZ+BIHWlFVcmo0eDW9aZw37yAJA155EGGhd67BA5eHnTX+E
	CLqRk7oA==;
Received: from ip6-localhost ([::1]:56566 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s4jp5-008XyL-9D; Wed, 08 May 2024 16:07:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30084) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4jp0-008XyE-Qq
 for samba-technical@lists.samba.org; Wed, 08 May 2024 16:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=5Fl0ZWe43ajW29HIuORFUyzjHHQBey2u8N6Nblibtco=; b=GlQutfBhqtGq7i7ko8D9T0f3vj
 8Wks7cIRFHS4Tw3v6nh1b0XmkdFr2PpWQz5tT8S2k64xgSGeJEn4J4go5qKE1LGhjmdwf9FB4sGyq
 i1ETSxZlvfx90taKc++/lwV/Ab0hSWmFsyQlwxxwBp2A7hDfmJz0FnOF2RI5xPiz8Q/uYBYW+q8L2
 uW9lbklmlhwvrwlu68Hy1XQ2y4CA7j/eroph1h5YMbi0i+JrUdByv72sUuDk7ZFmeQa3OS2NbHxZu
 aYZ4kFFN7Bv2Nn+deNOjB+yNkpQAeA2PDBF+BmrOL8HITQ+QVvYLt4KVDCJ620/8rtKmm7lwrPH5I
 aZKQYTUBJCyR/V39ArrJS7ARLBEVCVzjBicY/4o689wiZwq9w/ztT27ZO9NZc3ndknI0nwWFoZ0/t
 m4A2DSH85tmW01AbvEvJLmLCHPwTeterUFfskvFuwf2GM2jeUaD04EckN7W2k64rHcCgy0fd3gbup
 eHwQRwgvCDJl0Dvp41NU4vM3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4joy-00ASrI-1m; Wed, 08 May 2024 16:07:08 +0000
Message-ID: <e3ed06dd-de31-4679-a184-f001beb1375e@samba.org>
Date: Wed, 8 May 2024 18:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Gitlab CI fails
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <2650765.fDdHjke4Dd@magrathea> <2823827.DJkKcVGEfx@magrathea>
 <2a68e98b-a3a0-4ef1-bf36-2dc9a99e32df@samba.org>
 <3788e216-2309-410a-8840-6bc88256d587@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <3788e216-2309-410a-8840-6bc88256d587@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 08.05.24 um 15:54 schrieb Stefan Metzmacher via samba-technical:
> PermissionError: [Errno 1] Operation not permitted

In the meantime I created
https://gitlab.com/samba-team/samba/-/merge_requests/3624
in order to unblock us.

metze

