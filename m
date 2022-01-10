Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 811A7489563
	for <lists+samba-technical@lfdr.de>; Mon, 10 Jan 2022 10:37:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=tSle5EhQJ9oI1ibctczj61lByhJRjLLE8+d9femRruw=; b=pN9Z7M54/Yzwq48881pD4G2UES
	hCwQwBF1VySmufwl7Q0CkGqEVKyc+KWA5OZjmLOPyoW4mk9uhJb3XVJ2E7uKSYcom35SLoJvXW/g0
	FhQSUnIavoEzAD7eDtD3lJCeC49KPhM5WxeTTOlDTb/7hQi0+aItPwJ8K9A6L6CgWLjeqJI2ijGza
	enAM4wne66WU8+shH94AUr8EFVpBgUVzw3axoBEfuHmSZp52TEcfl/EQ4oO8R+oBzplOau0/Bzo70
	BRwS5KVTOcAkygyfuMFHcCqj2lyNPivPCzw6EljTVVZs5UeUlTZiFxSi7mev53Z2/WP/AG2iYKHNK
	fks/94qw==;
Received: from ip6-localhost ([::1]:47962 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n6r6l-006Ay6-Ct; Mon, 10 Jan 2022 09:36:55 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:35409) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n6r6c-006Axx-EJ
 for samba-technical@lists.samba.org; Mon, 10 Jan 2022 09:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sernet.de; 
 s=20210621-rsa;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tSle5EhQJ9oI1ibctczj61lByhJRjLLE8+d9femRruw=; b=LwnQslASiYkdVGIsS3N/jhKx3d
 7lW3ceqk9zgivCdy7ydjk7WXNxwWimyOy8DiUdQ4EBacR/gqyhrzeUExNU0FRUCRxYbZSJvhx5mEm
 /t3nrHxVV3jVLVjeOpMxVB893hRBbbN7531JSY3h9+l06IGN3eOAgCXPju9XzZi3eyzg3b4IK4SjX
 DQ6EKP+PN6TQPaACSTN7yp2QobNEgzTHwsL4bbhEgKgjriwIG4z6GumIuT3FT6LSMxRgASkYLTmps
 uyC41PZ2jT0GojQo4q/qNjUj2fmi6SLSUuAyzQHz2hyMA0Gsa3ZVI0C3wikYlXBw76ykMex75GdXc
 kYCCgs6A==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sernet.de; s=20210621-ed25519; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tSle5EhQJ9oI1ibctczj61lByhJRjLLE8+d9femRruw=; b=fGX53os+y/vEDRWLBVoJ0NOjuh
 BvA6dBt2zL+ig3mZFOb14EoV5eZLkN4ecXCsfdsi97srNWqer8X8BkavTiDA==;
Received: from intern.sernet.de by mail.sernet.de
 with esmtps (Exim Mail Transfer Agent)
 id 1n6r6a-000071-VU; Mon, 10 Jan 2022 10:36:44 +0100
Received: by intern.sernet.de
 id 1n6r6a-00080W-Sw; Mon, 10 Jan 2022 10:36:44 +0100
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1n6r6a-001YLG-EJ; Mon, 10 Jan 2022 10:36:44 +0100
Date: Mon, 10 Jan 2022 10:36:44 +0100
To: Jeremy Allison <jra@samba.org>
Subject: Re: Unbecome Root in VFS Module
Message-ID: <20220110093644.GA369564@sernet.de>
Mail-Followup-To: Jeremy Allison <jra@samba.org>, Orion <orion@et.byu.edu>,
 samba-technical@lists.samba.org
References: <f48481ea-1c2c-51fc-89a3-c7c81b97e48d@et.byu.edu>
 <YdZW8mY5liRL+TDN@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YdZW8mY5liRL+TDN@jeremy-acer>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Cc: samba-technical@lists.samba.org, Orion <orion@et.byu.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2022-01-05 at 18:41 -0800 Jeremy Allison via samba-technical sent off:
> It most certainly should work - if you notice, it's
> very common for Samba to do:
> 
> become_root()
> ... do privileged operation..
> unbecome_root()
> 
> > Is there another way to change back to normal UID/GID from within the
> > VFS module?
> 
> Explain "but it did not work" more completely please :-).
> 

I think what he means is a related problem like in
173923c41aee6533532024ece8cd0fb62b06d316 . With NFS we should really not do
become_root usually I think. As we don't know if the underlaying filesystem is
NFS or not, how about querying the quota without root first and fall back to
root if it fails? (Or the other way round?)

Björn

