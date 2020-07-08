Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 878422189E8
	for <lists+samba-technical@lfdr.de>; Wed,  8 Jul 2020 16:16:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=jk8RJSdeZ3iRiKwg9nwb9NeAVxdIn8q059ESchgsshQ=; b=l4SRc/5l9gQGvsRhhihd9oKOrM
	MNPpjBvAqVo1ZMtFMP5q3QY8VCq/b2dZdyG/aRW0P5P/Yo4Lde/UOcuqSXSuRTeqQrlDEgw2i4PRC
	OEtKrS+HAXmbm8YRbWeJnJvZQW5vO7TR+nE3+BUW9ZJYzb4sa0nGIso1Pi/OiqnDI8lSjDhtQlyYn
	BDfzfOQsNLprrHRk8f2hPMxM9pBpx1+F+PwoPhOk7FQk0fllkWC2cNqjreT7iLeyNyjDLMhxzuNK5
	gzFcStptnwD3EehYGIwG5VsmZuW43ovaVg9+iFvVpRvuPVMhwjl/WShNROVwN1qq2TTVETJbKmO33
	KDC6OaOQ==;
Received: from localhost ([::1]:50580 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jtArl-0069Y5-N3; Wed, 08 Jul 2020 14:16:06 +0000
Received: from mx2.suse.de ([195.135.220.15]:44594) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jtArd-0069Uc-UU
 for samba-technical@lists.samba.org; Wed, 08 Jul 2020 14:16:00 +0000
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB53BAC40;
 Wed,  8 Jul 2020 14:15:54 +0000 (UTC)
To: Wei Yongjun <weiyongjun1@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 Steve French <sfrench@samba.org>
Subject: Re: [PATCH -next] cifs: remove unused variable 'server'
In-Reply-To: <20200707112741.9496-1-weiyongjun1@huawei.com>
References: <20200707112741.9496-1-weiyongjun1@huawei.com>
Date: Wed, 08 Jul 2020 16:15:52 +0200
Message-ID: <87o8oq5bzb.fsf@suse.com>
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
Cc: linux-cifs@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Reviewed-by: Aurelien Aptel <aaptel@suse.com>

--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

