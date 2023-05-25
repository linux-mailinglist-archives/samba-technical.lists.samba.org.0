Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 917D4711A16
	for <lists+samba-technical@lfdr.de>; Fri, 26 May 2023 00:15:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=3eZAgKIBQv9a78xj/T8D4m2MEU8G/Fe/i8jppO4GU8Y=; b=Hpe9VWFr65VCsuyVIo6oMc9Ckk
	Lne9kduuqBo57ozYQmxMz9x/pBslYxvA+xZxiytrHtyPSbMCZ+CpfuBc1q5BbSHLvDLwgt1jL/q89
	rkkj4PQ03IQKzY2MRPCFu4Pq5lsDL6oB0i0yoVaW5JppwWWmXWofR+B5lvsq0RKUI9/jzeqaiJaZ7
	//V+mjZU36R4YQBvvCtImtgf66KA+/bk04KeHzKlU8uWhIt/8v8xH2hrzWPhDDZixDp0+5CojfLLV
	G963r4PVXLPLm8DRQaf4dDTuLz7YGVl1WuVmO2qOhIQg3AGOUni6jDKpai7jr1o2IH06PlKf5FCkq
	DUqVuBAg==;
Received: from ip6-localhost ([::1]:63806 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q2JEY-00CMFt-Uz; Thu, 25 May 2023 22:14:59 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:57781) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q2JEU-00CMFk-MY
 for samba-technical@lists.samba.org; Thu, 25 May 2023 22:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sernet.de; 
 s=20210621-rsa;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3eZAgKIBQv9a78xj/T8D4m2MEU8G/Fe/i8jppO4GU8Y=; b=sBC/Or76iu0Vy0H8ptCl30R7UL
 mWid88qSfs0bZa2Du1fvkUi1yHxI+jIQiFzQnxKjJgI0AtMd1ffSAdq1FlkFKBXcpsf2GgHP3wF/E
 PoOH/UlZTjC1NfWAofTZr4ThKjqDewDQIQREYmnU2L9oCJcXM9Y/fE0kYfKBUN9kDrddNEVohgH6Y
 wnDPzQwqEAm0FhtWQLrtv3ze1UT6gVl6HHQI1RWuR+sOXma1pZJEvZp+/1IxIGwcuK4RFoOQcFxTi
 vOIpkzNrmLeyT8cvu3xSoranLpewp7oFpFND32MTTC2dXeSD0zTlNVdB2/2uQtMZvXDFTcWCZlEyG
 aKLc5kUA==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sernet.de; s=20210621-ed25519; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3eZAgKIBQv9a78xj/T8D4m2MEU8G/Fe/i8jppO4GU8Y=; b=wu1DNzFMT10WdrXvov/pMzhexE
 W1TpI1ojcWukrQLzFw2amlIrWpfia5yZNSlB6PcOm/afLtfFcLhiRqYzXkAQ==;
Received: from intern.sernet.de by mail.sernet.de
 with esmtps (Exim Mail Transfer Agent)
 id 1q2JES-008uRU-8c; Fri, 26 May 2023 00:14:52 +0200
Received: by intern.sernet.de
 id 1q2JER-004r34-W3; Fri, 26 May 2023 00:14:52 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1q2JEP-00034a-G6; Fri, 26 May 2023 00:14:49 +0200
Date: Fri, 26 May 2023 00:14:49 +0200
To: Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>,
 ronnie sahlberg <ronniesahlberg@gmail.com>,
 Christoph Hellwig <hch@lst.de>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Subject: Re: Displaying streams as xattrs
Message-ID: <20230525221449.GA9932@sernet.de>
Mail-Followup-To: Jeremy Allison <jra@samba.org>,
 Steve French <smfrench@gmail.com>,
 ronnie sahlberg <ronniesahlberg@gmail.com>,
 Christoph Hellwig <hch@lst.de>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
 <20230525093900.GA261009@sernet.de>
 <CAN05THTi0BC_iwjXMiWn61fg3hRemi5Momwp3O0WGygyWLGomQ@mail.gmail.com>
 <ZG+LOKTr8B+zjQsC@jeremy-rocky-laptop>
 <CAH2r5mv7aZ8nm30oKyYpa-bd8-MqA13EcEmQWV4mOyrV-rj8Ug@mail.gmail.com>
 <ZG/DajG6spMO6A7v@jeremy-rocky-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZG/DajG6spMO6A7v@jeremy-rocky-laptop>
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
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@sernet.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2023-05-25 at 13:22 -0700 Jeremy Allison sent off:
> I think cifsfs providing access to ADS remotely on Windows
> and Samba shares is fine.
> 
> What I'm scared of is adding ADS as a generic "feature" to
> the Linux VFS and other filesystems :-).

full ack on Jeremy's view here.

If there is something the the Linux VFS layer should *really* add to help 
interopearbility with basically all other major OS implementations is NFSv4
ACLs.  Seriously, for so many people living with Linux is a real pain due to
the lack of NFS4 ACLs here.

Björn
> 

