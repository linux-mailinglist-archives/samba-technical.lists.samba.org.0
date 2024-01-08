Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DBE827A6D
	for <lists+samba-technical@lfdr.de>; Mon,  8 Jan 2024 22:51:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=h3L9Ms3RJbkhDRpENMDIIkYxze9oX7IYZ5aUjYfsps8=; b=tUnHbU39rbuuibtd5mgKwSSJSE
	lAIYkI+1tcaafaPc5NsqEn26vnhN6YdEljqhRHpcpUNAy6h9vf/bfvImRCXP7Lj8JJ78ICMKiioJ5
	zonlF5ZOY12O2F8nJYMpbihXNybL2rN46aZYsGcrLWW3ipYiCkS6Qs3VmbhJzh9iSkmRJnrkvSbwZ
	BJ7DlH9GjsWtVWOUuhOo3egFp6BSgkDnVLvB70/wGtw+zYCcYgqeWmgMpL+KoLEOkoG576SXuDa08
	ahGYdE/A3r9GaMZhrcW8KTHzWZPfu47EYGvZwXHLSIHVJ3fSw3wAf0gokeK+bq/YQuyrTfjqKB5ce
	w34zwDbw==;
Received: from ip6-localhost ([::1]:43738 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rMxVt-002pFl-9Y; Mon, 08 Jan 2024 21:50:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59295) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rMxVn-002pFc-RO
 for samba-technical@lists.samba.org; Mon, 08 Jan 2024 21:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704750620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3L9Ms3RJbkhDRpENMDIIkYxze9oX7IYZ5aUjYfsps8=;
 b=P17I2cxE8Ijp+ve3OqPoIjQq4xz2PheqvzOTVja1FR6BgR+E/Q0+OP9vIFmHxemuhAfXZE
 yAOl/pP6oAqxWNJHONBgr7NoH8kOH8BMnx06GlSilH962NpL90ArPT5uvQ2kZ0EOA2FLyH
 fFyAW6p0pbDxoK36i43MQh37yZNs7WI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704750620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3L9Ms3RJbkhDRpENMDIIkYxze9oX7IYZ5aUjYfsps8=;
 b=P17I2cxE8Ijp+ve3OqPoIjQq4xz2PheqvzOTVja1FR6BgR+E/Q0+OP9vIFmHxemuhAfXZE
 yAOl/pP6oAqxWNJHONBgr7NoH8kOH8BMnx06GlSilH962NpL90ArPT5uvQ2kZ0EOA2FLyH
 fFyAW6p0pbDxoK36i43MQh37yZNs7WI=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-u0yWH5OSPO6kzR2fn5mOFA-1; Mon, 08 Jan 2024 16:50:18 -0500
X-MC-Unique: u0yWH5OSPO6kzR2fn5mOFA-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-5e9074bb7c5so29503767b3.0
 for <samba-technical@lists.samba.org>; Mon, 08 Jan 2024 13:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704750618; x=1705355418;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h3L9Ms3RJbkhDRpENMDIIkYxze9oX7IYZ5aUjYfsps8=;
 b=cyBjGJjZboWTh0o0XcO1Izb/HHKBNUDHtTLtUnMcna5A+Eo73wjd0NlSPRs32/hcRq
 KYjYjGOZ5Bw//M5KCgnnBeKomAFbtfNFgAbaFsQoDddnrntfcUaDEo+Rc0qWFeXyFY+I
 LRFf2nb4P39yBC70r5hQ3HgdWroOP9YnFkAxFTN/g/Mi9GdPO5fFbqe+XGdnsZRfknHu
 4L3fJDAbdtwbWuAQ/7NmzQIKkMoruSb+lncIzF9JcP3PkWIWiX/vWl54e6QnAn1KDb6f
 0W0gkM0Xu126Yiw1Ykk4SwEYxuQDkoiQ4YyQA8fQVplTskXPcVzCkPbVojpsOSoQ6j7r
 eTkg==
X-Gm-Message-State: AOJu0YzyGqEz7HDp759wwXzlulMltGJy9mFhTXJg05irOEk6gcN5xeZp
 5aqJvqHBLS5XuD49RGXhulSncrzvUTfn5U50ndIZ9Q7CN5bcRAdSzNR9CZ19Ce+2orlnBhoZzIK
 sITghtp64aE1onB0ohwWUPj6x0Gdv4XrnJrwPIVyy08pUZsH00TiU
X-Received: by 2002:a81:4742:0:b0:5eb:29e:45a3 with SMTP id
 u63-20020a814742000000b005eb029e45a3mr2758878ywa.32.1704750618192; 
 Mon, 08 Jan 2024 13:50:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0mjHn+eWP2TDMMlnHgtyr6G7HK36SREVu7O3klmm/rR5VIOWgvJQG4p4WgEySWe6CPqFJQ0L1ReKsmKeeIbI=
X-Received: by 2002:a81:4742:0:b0:5eb:29e:45a3 with SMTP id
 u63-20020a814742000000b005eb029e45a3mr2758873ywa.32.1704750617915; Mon, 08
 Jan 2024 13:50:17 -0800 (PST)
MIME-Version: 1.0
References: <CALe0_77CgEXNiXrM4oQ47sfHnDoML18oz5rmEu-_57Av0KRTkg@mail.gmail.com>
 <20240108181751.natpy6fac7fzdjqd@suse.de>
In-Reply-To: <20240108181751.natpy6fac7fzdjqd@suse.de>
Date: Mon, 8 Jan 2024 16:49:41 -0500
Message-ID: <CALe0_777GL=XQYSochOoph73madKm8DsRn+xQOcTmz9xh+wcHQ@mail.gmail.com>
Subject: Re: Linux client SMB and DFS site awareness
To: Enzo Matsumiya <ematsumiya@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
From: Jacob Shivers via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jacob Shivers <jshivers@redhat.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello Enzo,

Thank you for the response!

I failed to mention the initial aspect that is specific to mounting a
domain based DFS share. This would contact a random domain controller
instead of a DC local to the calling client's site, should it exist. A
CLAP ping like that used by SSSD[0] could be used to identify the
nearest domain controller prior to initiating a subsequent mount
request. This is where the DNS discovery for a ldap entry would be
applicable.

Hope that helps to clarify the use case.

Thanks again for the response.


[0] https://docs.pagure.org/sssd.sssd/design_pages/active_directory_dns_sit=
es.html

On Mon, Jan 8, 2024 at 1:22=E2=80=AFPM Enzo Matsumiya <ematsumiya@suse.de> =
wrote:
>
> On 01/08, Jacob Shivers wrote:
> >Hello,
> >
> >I have a use-case for a Linux SMB client to mount DFS replicated
> >shares, with a preference for sites that are closer geographically.
> >DNS site discovery/awareness exists within DFS[0], but I have not read
> >of any work currently under investigation.
>
> DFS supports referral responses based both on site location and site cost=
ing,
> which are done on the _server_ (MS-DFSC 3.2.1.1 and 3.2.1.2).
>
> For site location, the targets are sorted with targets on the same site a=
s
> the client first, in random order, and then targets outside of client's s=
ite
> are appended, also in random order.
>
> If supported and enabled, referral responses based on site cost will, pra=
ctically,
> sort the targets from lowest to highest cost (relative to the client,
> and in random order if same cost).
>
> On either case, the client will try to connect to the targets in order
> it was received.
>
> >[0] https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adt=
s/7fcdce70-5205-44d6-9c3a-260e616a2f04?redirectedfrom=3DMSDN
>
> I don't see how the info on that link would apply to this particular
> scenario, as doing such discovery on the client would be redundant since
> the server, if properly implemented, already did it.
>
> Please clarify if you think I misunderstood your case.
>
>
> Cheers,
>
> Enzo
>


