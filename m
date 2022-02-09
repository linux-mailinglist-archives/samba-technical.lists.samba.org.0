Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E930F4B0092
	for <lists+samba-technical@lfdr.de>; Wed,  9 Feb 2022 23:45:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=LvrTfeQVlg482xFYtlFzLlP7NM+UvwLAymbHWk5cSXY=; b=ZS/rvjUxxkQBdpTs3f0Animuvr
	cFE8d7vqsWb3GEJ8ucPh+pz8KiIK/TF9HXa/1O1vARtHnTMXnMIn38XyFibC7RuBZ4pQJoktWTO7N
	iR0hGcX+HNcV4WvsCYUl4FRch0MrZ6HEfU2i3W3V+SxB2lDS6ObwDoxxiq34eJSqa+mcOexmrblkn
	zuNG8tIYXpDdugbUQovFpoARHEzaSezctj8XoeKePiPCtAajhhRDT771hGUnbhwXzDlUHW5oJfAiz
	lLxEWRmfMMpkShFDu0YzfBzSVJzL7cb3dqV0FxT0tLGzr6A3xcheSH1+2tmndml6x7LsqSUTJCIQU
	yO3HpRMw==;
Received: from ip6-localhost ([::1]:20552 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nHvhi-0062A3-5N; Wed, 09 Feb 2022 22:44:50 +0000
Received: from sender-op-o11.zoho.com.au ([103.138.129.1]:17068) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nHvhc-00629u-7n
 for samba-technical@lists.samba.org; Wed, 09 Feb 2022 22:44:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1644445753; cv=none; 
 d=zohomail.com.au; s=zohoarc; 
 b=bQ+QL1bFROivhOraYyo1MkMpirOQiO74JpN3tVsePt3zR0D0sLwzLeim2sMRGxi5WUR2bequEwPHUFEzfe9RGnvnDBjfZ3Ah3XTqa3oDCyvwtNTkHmDI/4sOm4Gic4zcOjIZqBzO4NfgeJU3F02Cv1Wh+5bWV8DjiCudciO0leY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com.au;
 s=zohoarc; t=1644445753;
 h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=LvrTfeQVlg482xFYtlFzLlP7NM+UvwLAymbHWk5cSXY=; 
 b=rfUzlBF+iv5aj2tuzm6g+orL16WFoV8NcINSYFAd+aWqbxO3isk+Vj87bAmwtOEmsTv1NS1vIgZ4TtTWL0O+TWV5ONfKIcocq/jnstbAux5ICEE2yNBa5ZPjAgyyETV87B4bx3DpI7KXgPr2d8pvdVS9Hupuv4+ajwxobJW7XgE=
ARC-Authentication-Results: i=1; mx.zohomail.com.au;
 dkim=pass  header.i=smedley.id.au;
 spf=pass  smtp.mailfrom=paul@smedley.id.au;
 dmarc=pass header.from=<paul@smedley.id.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1644445753; 
 s=zmail; d=smedley.id.au; i=paul@smedley.id.au;
 h=Date:MIME-Version:Subject:To:References:From:Message-ID:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=LvrTfeQVlg482xFYtlFzLlP7NM+UvwLAymbHWk5cSXY=;
 b=LZKua3ceoMwJhGGwblrVffsKkqIopuJScYro9b2cpgAQ39J1mhWkVTrvl+G5eTVH
 mDP4Iope7LmHAfaqaWsXsG9cY3EQoCYTfrZZRvHb6taveGKasjTtabjrMFBgTaJB5Y5
 6ULxAdbfjXdsKEZqNRQCFWfa4KbgVMsYsNUH8lXw=
Received: from [192.168.1.159] (61-245-148-167.3df594.adl.nbn.aussiebb.net
 [61.245.148.167]) by mx.zoho.com.au
 with SMTPS id 1644445752712623.4350036645079;
 Thu, 10 Feb 2022 09:29:12 +1100 (AEDT)
Date: Thu, 10 Feb 2022 08:58:51 +1030
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Samba] Remove LanMan auth from the AD DC and possibly file
 server?
Content-Language: en-AU
To: samba-technical@lists.samba.org
References: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
 <28c3b502-7146-4403-b728-4815dafa9110@samba.org>
 <4406c0a37ed78d50bef9d10198fb6e565e633588.camel@samba.org>
 <YgH8F7/VoCe0pUyv@jeremy-acer>
 <9366e519039acf37002ab5f99c9038d378550e4b.camel@samba.org>
Message-ID: <b77b6916-626f-22cc-2885-80936e76280a@smedley.id.au>
In-Reply-To: <9366e519039acf37002ab5f99c9038d378550e4b.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Paul Smedley via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paul Smedley <paul@smedley.id.au>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hey Andrew,

On 9/2/22 08:44, Andrew Bartlett via samba-technical wrote:
> Bj=C3=B6rn, after reading the discussion here is your position still that=
 we
> need to retain LanMan authentication for DOS, OS/2, Win3.11 and Win9X?

I'm not Bj=C3=B6rn, but speaking as someone who has some involvement in=20
ArcaOS (https://www.arcanoae.com/) which is the modern day successor to=20
OS/2, ArcaOS ships a client currently based on Samba 4.11.x so there is=20
a pathway for OS/2 users to update their CIFS.

Cheers,

Paul


