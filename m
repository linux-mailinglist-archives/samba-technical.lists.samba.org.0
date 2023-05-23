Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C37070CFEB
	for <lists+samba-technical@lfdr.de>; Tue, 23 May 2023 03:00:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zC8RUZgKRRIeFzEm4HicM3NMEy9A1nX6MMx3jlb5aEw=; b=XkwqtqC7XcCXs5JEHyI+13abbJ
	38vcE9/69q0L4DD+UuJKFTDPfTpT0PLOdGCq5tP7FPNRDu+fDW3FFi9s6wc1zR8NJQnJ6/vdqkSTi
	S3idnAgYI2RO4I4X0viFSi0OPvxb0HwDzAuUBQqTnGvmpjrEGSYTj9ldKKf2I7Cq4+ekQ/wMzKd1g
	NrDFljC4iXyaQsUL1wE8ab4Uwy8MxJ7143NWeOLw7+7vI6OmQnJAYFjwLu5wBLlNm7rXdUkzEXOjU
	Wd2+Jmd/yiPjMxrcdi7dujN8+TwuXQ8KuUL9hX16OfyZ3cviu46qAA72s+biVujv2D7C6ctGkvv9W
	gANcXXJA==;
Received: from ip6-localhost ([::1]:34010 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q1GNP-00BVu6-EF; Tue, 23 May 2023 00:59:47 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:58731) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q1GNK-00BVtx-9b
 for samba-technical@lists.samba.org; Tue, 23 May 2023 00:59:44 +0000
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-96fbc74fbf1so430189266b.1
 for <samba-technical@lists.samba.org>; Mon, 22 May 2023 17:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684803581; x=1687395581;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zC8RUZgKRRIeFzEm4HicM3NMEy9A1nX6MMx3jlb5aEw=;
 b=MgSu/+W7gpyExLKFQ4w1suZX0b+bub56fQ9zmpayVoSnY2H7CjEjlVI/wwPFR4SSK7
 3IprQ4TsMHVs/Y+aHrTU5p1Od4gvPPdwPCle1VSSKRDTC35roXn3Iyy/yIh4CH6/4Za7
 fZGwCcx4r4uqxrFTvTHgNt0o9cEHgZjGPdYevYXdu8YMYhckmX+RAeen1o1YjynJybQj
 KJPrdvb+M+Hv60rLPIHcqyRXL7GAaqAv7k2506t1uffdUZBUqlpwm02CB0PyrkvG9r+z
 WGGYAYCAgOIdhwLnpWLmxngKKtFcR8ymJIk+DGdsdP5ayadgL7NttWiXP8ZuUTN3fZo2
 VKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684803581; x=1687395581;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zC8RUZgKRRIeFzEm4HicM3NMEy9A1nX6MMx3jlb5aEw=;
 b=Cv++EcoR4DCNm4EYn5w2EUAW9TRB8RmmoYNrcaRpozCqotiq0NSmAtgFc8agJqJAwI
 COMGo7Xfkjb3HoRtR/5vv4nwbxO4xionGeLtPIDKn5MdFI2q/kAsa6WdblFYzzvbJEVQ
 bkTL5W0I5ssasGmt/lqjeTjol8sg6PL3ch46Qy/6t9lNWga1bawZ4aL/Bcqsmlej3r0H
 +dRMW3n2oh71k1Nv9mXpt57osv7PJcsUln5+vEMKuNYNgkSVBngSXAk72lzafgkl9Y+C
 20wmLTsWK+v0ftZJ5qD/RT07uO6AEneA3AeRTcrcvk/ad1dzfksJktZNDLabFDRbz8sG
 o/Iw==
X-Gm-Message-State: AC+VfDwUjfwVEZH22u5HFmbxfIcOEE7POPAT/LzOuk9kGDzAS0w1bh6c
 YOXZAFEKYp6h1vcy9msOrkUY2XNqGHLMA7B8R9M=
X-Google-Smtp-Source: ACHHUZ4E/Q+hF6zLfH2qPomFTnb9Boa9tvBQutstIPgyI6b5tlGfRbqVQfACikWiEb5qhe27+CbrtuwGRBLksbwQRLg=
X-Received: by 2002:a17:907:96a1:b0:959:bbda:fa51 with SMTP id
 hd33-20020a17090796a100b00959bbdafa51mr13297131ejc.41.1684803580650; Mon, 22
 May 2023 17:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
In-Reply-To: <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
Date: Tue, 23 May 2023 10:59:27 +1000
Message-ID: <CAN05THRnHcZtTMLxUSCYQXULVHiOXVYDU9TRy9K+_wBQQ1CFAw@mail.gmail.com>
Subject: Re: Displaying streams as xattrs
To: Jeremy Allison <jra@samba.org>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Yeah, I don't think we should surface these as xattrs.
Xattrs are already way too small for most of the usecases of ADS on
windows (file metadata for explorer etc)
and they are also just an atomic blob and not a proper filedescriptor.
Since ADS is still just a file, any application that in the future
will use ADS features should only do so via
a proper filedescriptors, where it is possible to
seek/read/write/truncate/...  so IMHO we shouldn't offer them an
alternative but inferior API. Because they might mistakenly start to use it=
. :-(

There are no real applications, yet, for linux that uses ADS but there
are many that potentially could use ADS or
become ADS aware. GUI Filebrowsers would be a nice usecase. As would
making 'cp', 'mv', 'tar', 'rsync', ... ADS aware.

So let's not do it with xattrs.
No one needs/asks for this right now so it would be code we will have
to maintain but has no users.


What we should do though is think about and talk with the NTFS folks
so that we make sure our aims and APIs will align with the plans they
have.
And once we have multiple filesystems supporting it (cifs.ko and ntfs)
then we can start thinking about how to encourage external users and
applications to use it.
There are really nice use-cases for ADS where one can store additional
metadata within the "file" itself.

regards
ronnie s

On Tue, 23 May 2023 at 02:21, Jeremy Allison <jra@samba.org> wrote:
>
> On Mon, May 22, 2023 at 01:39:50AM -0500, Steve French wrote:
> >On Sun, May 21, 2023 at 11:33=E2=80=AFPM ronnie sahlberg
> ><ronniesahlberg@gmail.com> wrote:
> >>
> >> A problem  we have with xattrs today is that we use EAs and these are
> >> case insensitive.
> >> Even worse I think windows may also convert the names to uppercase :-(
> >> And there is no way to change it in the registry :-(
> >
> >But for alternate data streams if we allowed them to be retrieved via xa=
ttrs,
> >would case sensitivity matter?  Alternate data streams IIRC are already
> >case preserving.   Presumably the more common case is for a Linux user
> >to read (or backup) an existing alternate data stream (which are usually
> >created by Windows so case sensitivity would not be relevant).
>
> Warning Will Robinson ! Mixing ADS and xattrs on the client side is a rec=
eipe for
> confusion and disaster IMHO.
>
> They really are different things. No good will come of trying to mix
> the two into one client namespace.

