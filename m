Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F682EDE8
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 02:32:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/yRQPse6qS5n8TwGMMfaxf78MZP/YYbhh3nzkAxoqD0=; b=dV3AmUmScC29HxsR4zixj7TZC6
	JyAjpf0B28Mk9GSlLYVRqrFpP8wukL8JZLwkwoZWMafX7Qg9F6Vh5e0PXK13U/nqY6u6nXkAdZFOH
	/2l2IEMgwPRFzprMZi9GG6mxlvI0hHMSfaM7rwqAoSOWQjJuAZuhfFwB40dIaohroLkr/3/Zksw2m
	u8OJvpSfJB6fmc+wA4RUD3io6g2D1tWA5JsnLSPE8mWbbzi2cGi6UyE6BvGyID93XUEWEy5ofEJfa
	Iw94rDKgy8ON4SBisSNq/kQvkl8p2U9G4/nQqiuAtJyiB3nqRKl5IVVCPyZZJzEiujz8MuINGA/Xj
	9NxNQbIA==;
Received: from localhost ([::1]:65492 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLGgf-003mAb-9S; Tue, 30 Apr 2019 00:31:57 +0000
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:40386) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLGgZ-003mAU-R5
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 00:31:54 +0000
Received: by mail-yw1-xc41.google.com with SMTP id t79so4663611ywc.7
 for <samba-technical@lists.samba.org>; Mon, 29 Apr 2019 17:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/yRQPse6qS5n8TwGMMfaxf78MZP/YYbhh3nzkAxoqD0=;
 b=nUbFDxlX7P+MGSwjh2h1pJhMarECOfxLV/jnEspOYDRCpnOkHyhWg8kK1htkE1vp+c
 mvh6nES0Aux9txy9fIfcm+IcfAsdttXfETuHHned0k1ON/qCcbFPtQozYs2XeAENR5bZ
 SmYTm0BTZ5XWhpt8ffkcMXFhC2QaHD3ke3MrktOOxWsbcgcTymow3xGTqlvHecVNp0yW
 qZ43W8vL03MefSYGoKprDYMz8CcdGAG5fT/An+I1aISNbSRvsUo+yGHeneNBfT8eINdW
 pkyo5AsklDKDgmbKFTVbIJC35qZTtjOykVJah3CwAI9SyBS2QfArs79EhEHxmwlJ2pMU
 0v3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/yRQPse6qS5n8TwGMMfaxf78MZP/YYbhh3nzkAxoqD0=;
 b=Zw7qaqYXLZP/pPUI6yddKSV49iRjOZoVKUL1DEAHPI7FxaOzYGKgSYKvyUpfIF+l/d
 R1y4MRajcwYs+S+K8G48Mik/0QW1OqeJlejxz0s9NMBo5GuO4lvWeAiKMDxqd2h9NOIK
 DhuEhIDbOp6/8h0L1wn+293SHMtc5PovG182isfREzJp5f7brkeba9JTDEIJp3K4JLht
 7ZLDKmKs+QplHaLPOjKd/IQhV1Hf3hjVLdTcoUhl+HHOLB6N7z3Y23GyJJxbub8Z7dli
 jSYU8F9f8VT2uvp0INy2HEoAaNiElSSCMtjoUUhYWWz3aZg7VzXoO39Zkf8ayCUaE5Xb
 e6XA==
X-Gm-Message-State: APjAAAVfHBBTnYyYBblz1vuCDow6mqZasoe5X1VRzj87GIFG+6hRYqec
 xSwxyWFUDQSwM9PEHl/4QRuKtbalUOjc+peOKk4=
X-Google-Smtp-Source: APXvYqwh/Z2UbVbzyDzAdkPy9xtx2lRcxal05Gt8kW2UH5wGV+f2t3juLWLJvnsQVtVKmhTgH3dsoTD542H9YKOZopg=
X-Received: by 2002:a5b:543:: with SMTP id r3mr53951012ybp.462.1556584308728; 
 Mon, 29 Apr 2019 17:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAOQ4uxjQdLrZXkpP30Pq_=Cckcb=mADrEwQUXmsG92r-gn2y5w@mail.gmail.com>
 <379106947f859bdf5db4c6f9c4ab8c44f7423c08.camel@kernel.org>
 <CAOQ4uxgewN=j3ju5MSowEvwhK1HqKG3n1hBRUQTi1W5asaO1dQ@mail.gmail.com>
 <930108f76b89c93b2f1847003d9e060f09ba1a17.camel@kernel.org>
 <CAOQ4uxgQsRaEOxz1aYzP1_1fzRpQbOm2-wuzG=ABAphPB=7Mxg@mail.gmail.com>
 <20190426140023.GB25827@fieldses.org>
 <CAOQ4uxhuxoEsoBbvenJ8eLGstPc4AH-msrxDC-tBFRhvDxRSNg@mail.gmail.com>
 <20190426145006.GD25827@fieldses.org>
 <e69d149c80187b84833fec369ad8a51247871f26.camel@kernel.org>
 <CAOQ4uxjt+MkufaJWoqWSYZbejWa1nJEe8YYRroEBSb1jHjzkwQ@mail.gmail.com>
 <8504a05f2b0462986b3a323aec83a5b97aae0a03.camel@kernel.org>
 <CAOQ4uxi6fQdp_RQKHp-i6Q-m-G1+384_DafF3QzYcUq4guLd6w@mail.gmail.com>
 <1d5265510116ece75d6eb7af6314e6709e551c6e.camel@hammerspace.com>
 <CAOQ4uxjUBRt99efZMY8EV6SAH+9eyf6t82uQuKWHQ56yjpjqMw@mail.gmail.com>
 <95bc6ace0f46a1b1a38de9b536ce74faaa460182.camel@hammerspace.com>
 <CAOQ4uxhQOLZ_Hyrnvu56iERPZ7CwfKti2U+OgyaXjM9acCN2LQ@mail.gmail.com>
 <b4ee6b6f5544114c3974790a784c3e784e617ccf.camel@hammerspace.com>
 <bc2f04c55ba9290fc48d5f2b909262171ca6a19f.camel@kernel.org>
 <BYAPR21MB1303596634461C7D46B0A773B6390@BYAPR21MB1303.namprd21.prod.outlook.com>
In-Reply-To: <BYAPR21MB1303596634461C7D46B0A773B6390@BYAPR21MB1303.namprd21.prod.outlook.com>
Date: Mon, 29 Apr 2019 20:31:37 -0400
Message-ID: <CAOQ4uxirAW91yUe1nQUPPmarmMSxr_pco8NqKWB4srwyvgnRRA@mail.gmail.com>
Subject: Re: Better interop for NFS/SMB file share mode/reservation
To: Pavel Shilovskiy <pshilov@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "Volker.Lendecke@sernet.de" <Volker.Lendecke@sernet.de>,
 Jeff Layton <jlayton@kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Trond Myklebust <trondmy@hammerspace.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

...
> > > No. I'm saying that whether you intended to or not, you _are_
> > > implementing a mandatory lock over NFS. No talk about O_SHARE flags a=
nd
> > > it being an opt-in process for local applications changes the fact th=
at
> > > non-local applications (i.e. the ones that count ) are being subjecte=
d
> > > to a mandatory lock with all the potential for denial of service that
> > > implies.
> > > So we need a mechanism beyond O_SHARE in order to ensure this system
> > > cannot be used on sensitive files that need to be accessible to all. =
It
> > > could be an export option, or a mount option, or it could be a more
> > > specific mechanism (e.g. the setgid with no execute mode bit as using
> > > in POSIX mandatory locks).
> > >
> >
> > That's a great point.
> >
> > I was focused on the local fs piece in order to support NFS/SMB serving=
,
> > but we also have to consider that people using nfs or cifs filesystems
> > would want to use this interface to have their clients set deny bits as
> > well.
> >
> > So, I think you're right that we can't really do this without involving
> > non-cooperating processes in some way.
>
> It's been 5+ years since I touched that code but I still like the idea of=
 having a separate mount option for mountpoints used by Samba and NFS serve=
rs and clients to avoid security attacks on the sensitive files. For some s=
ensitive files on such mountpoints a more selective mechanism may be used t=
o prevent deny flags to be set (like mentioned above). Or we may think abou=
t adding another flag e.g. O_DENYFORCE available to root only that tells th=
e kernel to not take into account deny flags already set on a file - might =
be useful for recovery tools.
>
> About O_DENYDELETE: I don't understand how we may reach a good interop st=
ory without a proper implementation of this flag. Windows apps may set it a=
nd Samba needs to respect it. If an NFS client removes such an opened file,=
 what will Samba tell the Windows client?
>

Samba will tell the Windows client:
"Sorry, my administrator has decided to trade off interop with nfs on
share modes,
with DENY_DELETE functionality, so I cannot grant you DENY_DELETE that you
requested."
Not sure if that is workable. Samba developers need to chime in.

Thanks,
Amir.

