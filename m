Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 747931EB7E9
	for <lists+samba-technical@lfdr.de>; Tue,  2 Jun 2020 11:08:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=jk8RJSdeZ3iRiKwg9nwb9NeAVxdIn8q059ESchgsshQ=; b=akDOKRNKL+EiBf/TnhmH6WsStu
	4cIu/VXGumlIP/JAolCkWlfYMf8pC8FxPkkFIOn5cNwfAIXCqwGhTccLIzENbt55RN779fo52KYt/
	gi1/YnsRoiZZfXfk25XqXfbizrTYBA9T+buedEomqZsoIvl5dYoiYum86hzv660YdifWvu8nJPxq7
	7A4Xjx09xjTJO28jgg0Pp0Qyxbn8XsCHjUpbOl1t+Kw64hRIZNFk0VdGG+gGs0P/t/EeTFACnaEbD
	tWFIwRQdJ6eW6ZMUF1+cXebIfxvMEJCBKDqBy5MAi4+X04vWHYzc771Xw5IwyPKjZ9/T7WZhys05S
	CB4479nQ==;
Received: from localhost ([::1]:35214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jg2tO-008Pk3-7b; Tue, 02 Jun 2020 09:07:30 +0000
Received: from mx2.suse.de ([195.135.220.15]:47346) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jg2tI-008Pj5-OL
 for samba-technical@lists.samba.org; Tue, 02 Jun 2020 09:07:27 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2F0B9AE25;
 Tue,  2 Jun 2020 09:07:24 +0000 (UTC)
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
Subject: Re: [PATCH][smb3] minor update to compression header definitions
In-Reply-To: <CAH2r5muo=fPArSDa_8AEk0dT-3zA17N9HL7wCb=jP77RHQQQQQ@mail.gmail.com>
References: <CAH2r5muo=fPArSDa_8AEk0dT-3zA17N9HL7wCb=jP77RHQQQQQ@mail.gmail.com>
Date: Tue, 02 Jun 2020 11:07:20 +0200
Message-ID: <87ftbdkf93.fsf@suse.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Reviewed-by: Aurelien Aptel <aaptel@suse.com>

--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

