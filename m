Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 000FA8CA97
	for <lists+samba-technical@lfdr.de>; Wed, 14 Aug 2019 07:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=28L5FCr5e5bSQi8FcJnPgeuFB5eSibGD7z9lLxa3Gnk=; b=3xxqcuGtbWC1TDLtVs2bvFnX9k
	5wKBqnN1poMx6eEfM7N6+bHgij+mkvCVXua0b8N5sT5v9+oVdfBq9jYJq+FFkcJWnx/L7locFJeMc
	s6mQgiFb2IE4EBKfF5uYyB+YBPzleuQWXEYA1Q24UCTdOuIDx3XZ3B3GGpTBctA2y9KNepouQ6OPU
	f32lcsOjHC8/MoIpwpnIgJaU2dLAXQOVFQrEZu4dXh6AVLqhValJHbmAoaG47sdPB3wBK8zvLjx0E
	rTe1OZadiK2outvk2dD9N03I60tJyVWIinyTuZ+O0rnCSZrepKtF3mTgEtsKjrT8HuHp1L2qiFAmu
	mragvkZQ==;
Received: from localhost ([::1]:43118 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hxley-006Ejn-KH; Wed, 14 Aug 2019 05:17:20 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37958) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hxlet-006Ejg-Ix
 for samba-technical@lists.samba.org; Wed, 14 Aug 2019 05:17:18 +0000
Received: by mail-ot1-x342.google.com with SMTP id r20so29689869ota.5
 for <samba-technical@lists.samba.org>; Tue, 13 Aug 2019 22:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=28L5FCr5e5bSQi8FcJnPgeuFB5eSibGD7z9lLxa3Gnk=;
 b=V08Ba0UzSUo4Tper11MTchOv7U1E5L736UqB1CwgBmKElbmhe4xjiuBmWzAIICKAyz
 YwpUqDr+hOuDI+F3dNKMtnJjTi4DgRfcnlqJHusk3V0dipwtLJ3iLsQf5FTBHMOlEj+x
 R5BVc4HML8B2Of4cU6SyDDL/AW7n8tig8qoNDG5pUrSj3GtMVDxedTs2rbgvAjLXvstI
 elBJQytXk37n+wK2/vR2gHaQYMOvYwIXi45cLEg6ESxjUWcoo0jK4qOrl1y6K8Y+R+rV
 Bty1YPG7hf6P0V8V/bgz+B4LvMqyOFHpaUy7nnma1RTmZTF1mjSvFLJ36DnUT2iPWV/v
 HG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=28L5FCr5e5bSQi8FcJnPgeuFB5eSibGD7z9lLxa3Gnk=;
 b=aUfylv9mMjRsYYZSR+O8m1rd8o+E4OxqqFXUvGzxZutuDgYWfO3E9tTLW/kyXFTNSt
 1UaJ1cJ0rdODcwhmerNZnFI9pzm8SWeylh4mDLjMLc6Db4qPW4tq97Payohh8n4F9BWj
 bdsDBgd8c2p/t8xn7nd1yTqSD7FLjAd7O2k7SDBlo7tcjRavVmsBvAl2sBwvmEL2KUGn
 qf8eJBRykqn4d/5eQ6fhQb8tp0ScfzLdw6/4AhXzFNYS4IhsWGwXRvVVf/QTg/H/Slsi
 OHNpfnCcYDRPuV//+9HMA9erTPPKXiQ5hxNMprIcOdgcMCeqfds0FOhxFnFhe/bJCkVa
 2vdA==
X-Gm-Message-State: APjAAAVj/vCIOsYCaYzHeNSDMmOFZAX4vAzwrGc7foZqJdqBfWveVN3W
 aIOpxF5E83B8XohvmOM0I2eG9iHHTomVw93rpLJkng==
X-Google-Smtp-Source: APXvYqzN4726bOqLWFUDSzWDKOC42ty0ttlPi7dbPg0GpzhDwG2Qu61yGwgs6pH2wNOPzQ1kZEHJnquEJM1dGLMF9Z4=
X-Received: by 2002:a9d:5a82:: with SMTP id w2mr34800230oth.240.1565759832578; 
 Tue, 13 Aug 2019 22:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190814135302.7cae603f@martins.ozlabs.org>
 <CAJ+X7mQRwy7Uwe4nAMKxxUgDno0HsJPxxj0_Lf48eOngo6EBaQ@mail.gmail.com>
 <20190814144404.484e9e45@martins.ozlabs.org>
In-Reply-To: <20190814144404.484e9e45@martins.ozlabs.org>
Date: Wed, 14 Aug 2019 15:17:01 +1000
Message-ID: <CAJ+X7mT5K7aKu8f=_gzv9U3fxtnRHygraJhYGOGzcify_FcY_g@mail.gmail.com>
Subject: Re: [PATCH] CTDB TCP transport connectivity fixes (bug 14084)
To: Martin Schwenke <martin@meltin.net>
Content-Type: text/plain; charset="UTF-8"
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Aug 14, 2019 at 2:44 PM Martin Schwenke <martin@meltin.net> wrote:
>
> On Wed, 14 Aug 2019 14:22:27 +1000, Amitay Isaacs <amitay@gmail.com>
> wrote:
>
> > On Wed, Aug 14, 2019 at 1:54 PM Martin Schwenke via samba-technical
> > <samba-technical@lists.samba.org> wrote:
> > >
> > > Fix for:
> > >
> > >   https://bugzilla.samba.org/show_bug.cgi?id=14084
> > >
> > > The solution is to only mark nodes as connected when both incoming and
> > > outgoing connections are up.
> > >
> > > Included in this pipeline:
> > >
> > >   https://gitlab.com/samba-team/devel/samba/pipelines/76265339
> > >
> > > Please review and maybe push...
> >
> > In the last patch, there is no need to add "node" element to "tnode".
> > "tnode" already includes "ctdb" for upcalls.
>
> It is needed to be able to easily pass the node as the argument to the
> upcall.
>
> However, you're right that:
>
>   tnode->node->ctdb->upcalls->node_dead(tnode->node);
>
> could just be:
>
>   tnode->ctdb->upcalls->node_dead(tnode->node);
>
> Do you want to tweak it or should I?

Ah.  In that case we need to change the private_data for
ctdb_tcp_read_cb() to "node" from "tnode".  Then we have access to
"node" required for upcall.

Amitay.

