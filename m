Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 10590210BE3
	for <lists+samba-technical@lfdr.de>; Wed,  1 Jul 2020 15:15:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=jk8RJSdeZ3iRiKwg9nwb9NeAVxdIn8q059ESchgsshQ=; b=CAECS8cokWvlNeA9pQQmApgjyb
	y8KmkLHLgf+SgYyE8/qtrGgKQ/HhapjgZ67ostEORExBLLAiB6Uabp8Cx4OCEHTApLEm3uZZbfJNh
	hUqhQZEXRxCa4G4+MUWFvfy8z9DHXpmk/6vKkH3qhnL+lG++3lL7RapS504zzO0deLGv3v5DVEQ+n
	ZuZc+IqTOMAhwqUgSreGgDZSGoHqspoTSn53y5Xp08fgrC4pSvMSuWYvcZHP/+RgaMSWBNj0JWwLi
	3Sl/G6nedVYE0YGIjO8oAbd+adbiQG70AB0s9dsErDvjiYaRCphH7t1BwRjkvtSlOj3DS43VFnh2L
	rdh8ljJg==;
Received: from localhost ([::1]:35324 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jqcZi-004p53-WB; Wed, 01 Jul 2020 13:14:55 +0000
Received: from mx2.suse.de ([195.135.220.15]:57504) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jqcZc-004p4u-V2
 for samba-technical@lists.samba.org; Wed, 01 Jul 2020 13:14:51 +0000
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8711AAE17;
 Wed,  1 Jul 2020 13:14:46 +0000 (UTC)
To: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>, zhangxiaoxu5@huawei.com,
 sfrench@samba.org, piastryyy@gmail.com
Subject: Re: [PATCH] cifs: Fix the target file was deleted when rename failed.
In-Reply-To: <20200629010638.3418176-1-zhangxiaoxu5@huawei.com>
References: <20200629010638.3418176-1-zhangxiaoxu5@huawei.com>
Date: Wed, 01 Jul 2020 15:14:45 +0200
Message-ID: <87wo3nxtq2.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Reviewed-by: Aurelien Aptel <aaptel@suse.com>

--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

