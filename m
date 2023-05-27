Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C34FD713108
	for <lists+samba-technical@lfdr.de>; Sat, 27 May 2023 02:55:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=+s5R8rU9zOtLhbGaYKNg/rKFUrWAKJ7jWTZPP6eisok=; b=IuOG6P41iLn6Ms3l49FJ9crotQ
	hf84dM3+x6weZ4VKGCrU7Kl17eRI8bNnpBO4Nd9HDenINF7QbMeueveJY7sZaOr7wES9AkqluvwSr
	wXp3csNjz7HCoXl4We1KOhs6g1g0u0sbp3xCj/T5g2580nwJ8O6+6A96wRbLXJTPJVCyhgoelmawF
	QoDLX6qxjz3w5EDvzNgz0dOXuNEtxqgTOc+Gpirzs2N4zHCcdhM5FokrN43xIjnX/hBpyt/Qs8XhG
	xq3OPzUtW+/Bb6JgyG9LnW7sHBCVFzIJemdjZFx4jflU1/gPx5p+4f10OC6MWYFc/dKKg2ZT0Ev+r
	H2mcB0Qw==;
Received: from ip6-localhost ([::1]:49636 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q2iCZ-00Ca40-4U; Sat, 27 May 2023 00:54:35 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:53394) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q2iCU-00Ca3r-E5
 for samba-technical@lists.samba.org; Sat, 27 May 2023 00:54:32 +0000
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2af2ef0d0daso12661231fa.2
 for <samba-technical@lists.samba.org>; Fri, 26 May 2023 17:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685148867; x=1687740867;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PSrDAOuncnmgMKEhLTtv6pWxrit4qwtmGZ9syY10XvQ=;
 b=RGbj/Yh5kx4pBS8VqyIkk2gKfFPHi8rzve7ZsTliXCoc91VFMPWqP2sITIBWgmT84I
 l5EtexYBdHxRRsxsqmasPMq0G0e4UOoCmP2RsoHEea6HjROz9UBcfhXsifPgcq+sqYGf
 oQejZ6kK3K6LT0Qz5kgFw2u7xbYdKcMLjq0JLAp0S1Qsq0RfH8GK9NmRKuEFlaQXpxtP
 saA2CtnsIfWPbDzY5TR5zruzONcURZHpZml9qaXj5M9Njc7W8NokCfAvZ2X1Z1e/MqWh
 C6+0SIFQp3MP4Q8gexJuUUezaBWnqrvlg8aIxBNkh5AJH0G4J7A1Ln7TIi1X1rXb0sDh
 Yeig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685148867; x=1687740867;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PSrDAOuncnmgMKEhLTtv6pWxrit4qwtmGZ9syY10XvQ=;
 b=Xg3sejQy4tRU0dc7EaA0d9JWZQA/SKVUQmus+A3X02h/Xe0Qn1wVQXYH7MVSHmRRIi
 KvvXKv21oZM25++FDNF1aWbWKS6DxWFlW8nbSyy2HUylg0zIuhNapRy4OYiQ5pD39aXj
 VPwDYC/4OXfoFXZ3ZI4K8LQkidoR/ZJEKqFEGf1kgokC7lWf8OrO9+svTb9uqVRHDAkp
 gWzrKvsVYwMxAP/WONmIwUDVEt8r/pJCoysHonzwAVbx1IiZaB8PjZ5yeM7hQ9uThPPt
 IWkBMYI9Pg0NOOQm9T9plZZ+N4MLdl1iJDAb6W67rxcbqUDAWxaLw9iPyIMu4shBotHf
 oTBA==
X-Gm-Message-State: AC+VfDyrsyAGuEES3XiL7BGQcLZ5kjW4JDMCAkF1RgcXvxqhhUmSnG4V
 rLxbaywXaNYgxkSt7M8iNoMYCpU9V3LOr/Ue+f8=
X-Google-Smtp-Source: ACHHUZ5hhqgTa5QggV3GB4CzI94V1Nah4r5B6OnySgc3JpM5BHqXnbZ3RHmihsCKRE77U+YH3K1m3H4kathW063adyM=
X-Received: by 2002:a2e:9f14:0:b0:2ad:509a:22b8 with SMTP id
 u20-20020a2e9f14000000b002ad509a22b8mr1089718ljk.16.1685148866941; Fri, 26
 May 2023 17:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop> <20230525093900.GA261009@sernet.de>
 <CAN05THTi0BC_iwjXMiWn61fg3hRemi5Momwp3O0WGygyWLGomQ@mail.gmail.com>
 <ZG+LOKTr8B+zjQsC@jeremy-rocky-laptop>
 <CAH2r5mv7aZ8nm30oKyYpa-bd8-MqA13EcEmQWV4mOyrV-rj8Ug@mail.gmail.com>
 <ZG/DajG6spMO6A7v@jeremy-rocky-laptop> <20230525221449.GA9932@sernet.de>
 <CAH2r5mvGb_e-kjLoKpwF3Eg7f7oOGGKcM7rL95SkU4q=pSE1AQ@mail.gmail.com>
 <20230526160320.GA13176@sernet.de>
In-Reply-To: <20230526160320.GA13176@sernet.de>
Date: Fri, 26 May 2023 14:54:14 -1000
Message-ID: <CAH2r5muD89QUcaqWNQy5NUwyji9CinN_5kGcfFSQAbpJP5gn+A@mail.gmail.com>
Subject: Re: Displaying streams as xattrs
To: Steve French <smfrench@gmail.com>, Jeremy Allison <jra@samba.org>, 
 ronnie sahlberg <ronniesahlberg@gmail.com>, Christoph Hellwig <hch@lst.de>,
 CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 26, 2023, 06:03 Bj=C3=B6rn JACKE <bj@sernet.de> wrote:

> On 2023-05-25 at 18:50 -0500 Steve French via samba-technical sent off:
> > Today the "RichACLs" can be displayed multiple ways (e.g. "getcifsacl"
> > and various other
> > tools and also via system xattrs).
> > Being able to display "RichACLs" makes sense - and I am fine with
> > mapping these (and
> > probably would make sense to at least have a readonly mapping of the
> > existing richacls on
> > a file to "posixacl") and RichACLs are very important.
> >
> > Wouldn't it be easier to let them also be queried for cifs.ko via
> > "system.getrichacl" (or whatever
> > the "getrichacl" tool used in various xfstests uses)?
> >
> > I was also wondering how we should display (and how to retrieve via
> > SMB3) "claims based ACLs" (presumably these are reasonably common on a
> > few server types like Windows)?
>
> let's stop calling them RichACLs becuase that was only the name that
> Andreas
> Gr=C3=BCnbacher was giving his implementation of the NFS4 ACLs
>

Remember that at Connectathon conferences years ago when nfs4.1 ACLS were
explained  (fixing NFS 4 ACLS to address some missed things). The NFS ACL
ideas were modelled after smb ACLs so NFS ACLs have many similarities to
their predecessor SMB ACLs (although presumably do not support claims based
ACEs/CBAC/DAC yet)

>
