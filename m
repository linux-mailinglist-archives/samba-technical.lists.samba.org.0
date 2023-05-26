Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F4085712A27
	for <lists+samba-technical@lfdr.de>; Fri, 26 May 2023 18:04:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=MkmKNeCFSRiyIak7l4SgZKeHT277T4B9MfQhNYGMBtk=; b=QA+/q0eYinYL9ZxnEUFN34QmM3
	qCipMIW+Sl+byc6w+PvbamxfXs5msZj//aiRKBhchyGqX0RmWz/8doNx4/vL5XNZej0Qyzr5agTXD
	b4GOOoL9alSI/JzlJqBuXAH8hqR1/BGbheWxlcrzF4Vzv/0TykD08phZu5mOcN47Mnnfyqlbt/VLY
	8vcb0ZjkStumh8cKEEffySn/oJ+CiT2ys1ihd+W1acofIQlNQs6GUX3/Ok/6A+6LKc0YcumG1JCx2
	wVZn2suzP/jfCav1PO0KKxJH/EL8F4FCv4u5CQflDAv1LQ5LyVWk+o2weTNlKLVDonrUpOp0Kundk
	Xh54kcRw==;
Received: from ip6-localhost ([::1]:28500 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q2Zuc-00CWQi-CO; Fri, 26 May 2023 16:03:30 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:49351) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q2ZuW-00CWQZ-NG
 for samba-technical@lists.samba.org; Fri, 26 May 2023 16:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sernet.de; 
 s=20210621-rsa;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MkmKNeCFSRiyIak7l4SgZKeHT277T4B9MfQhNYGMBtk=; b=VFUSiIKEsy8IJ5Rl1UJLm5EbB8
 km8ee4NZtK9R/RfJTg+xnqOdaCSInB9XJnDyKDQzD5vWnw/aDF8snl8+7B+Kgc9n7yxcfpVqIuS/2
 R6a3W1z3pkLz2KUV7VYosXu+mllqILTPwGLdkJQwhPoW59kpHLdEOcwAtBg9n/WDqN5mUkOAQm2Kc
 aA6O70EhmBOM9u6Mg/Ztn92N/ZO36Y4roIlIT5c8aJPRvLcCR2HvzawDiTJQxMBuQnDIxGUD5T/fi
 u5xVqkA9th2ec8XprnELtWUju7lyEZ/TOVTcUNz+ejNxy5b5fdTQOn3f9pNK2JynYfWew67GHEnaK
 HJAUfh/Q==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sernet.de; s=20210621-ed25519; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MkmKNeCFSRiyIak7l4SgZKeHT277T4B9MfQhNYGMBtk=; b=ubX1vi+5S92zGqgZF5FCJZG+bq
 fUA9q9m/GlUsS0IjNPUKIsOZRkDyXaw2hUA59b+KEaYgEBEC9IlgrUUqbFBw==;
Received: from intern.sernet.de by mail.sernet.de
 with esmtps (Exim Mail Transfer Agent)
 id 1q2ZuV-009jAa-7c; Fri, 26 May 2023 18:03:23 +0200
Received: by intern.sernet.de
 id 1q2ZuU-0055Rp-Up; Fri, 26 May 2023 18:03:22 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1q2ZuS-000926-RY; Fri, 26 May 2023 18:03:20 +0200
Date: Fri, 26 May 2023 18:03:20 +0200
To: Steve French <smfrench@gmail.com>
Subject: Re: Displaying streams as xattrs
Message-ID: <20230526160320.GA13176@sernet.de>
Mail-Followup-To: Steve French <smfrench@gmail.com>,
 Jeremy Allison <jra@samba.org>,
 ronnie sahlberg <ronniesahlberg@gmail.com>,
 Christoph Hellwig <hch@lst.de>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
 <20230525093900.GA261009@sernet.de>
 <CAN05THTi0BC_iwjXMiWn61fg3hRemi5Momwp3O0WGygyWLGomQ@mail.gmail.com>
 <ZG+LOKTr8B+zjQsC@jeremy-rocky-laptop>
 <CAH2r5mv7aZ8nm30oKyYpa-bd8-MqA13EcEmQWV4mOyrV-rj8Ug@mail.gmail.com>
 <ZG/DajG6spMO6A7v@jeremy-rocky-laptop>
 <20230525221449.GA9932@sernet.de>
 <CAH2r5mvGb_e-kjLoKpwF3Eg7f7oOGGKcM7rL95SkU4q=pSE1AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2r5mvGb_e-kjLoKpwF3Eg7f7oOGGKcM7rL95SkU4q=pSE1AQ@mail.gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>, Christoph Hellwig <hch@lst.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2023-05-25 at 18:50 -0500 Steve French via samba-technical sent off:
> Today the "RichACLs" can be displayed multiple ways (e.g. "getcifsacl"
> and various other
> tools and also via system xattrs).
> Being able to display "RichACLs" makes sense - and I am fine with
> mapping these (and
> probably would make sense to at least have a readonly mapping of the
> existing richacls on
> a file to "posixacl") and RichACLs are very important.
> 
> Wouldn't it be easier to let them also be queried for cifs.ko via
> "system.getrichacl" (or whatever
> the "getrichacl" tool used in various xfstests uses)?
> 
> I was also wondering how we should display (and how to retrieve via
> SMB3) "claims based ACLs" (presumably these are reasonably common on a
> few server types like Windows)?

let's stop calling them RichACLs becuase that was only the name that Andreas
Grünbacher was giving his implementation of the NFS4 ACLs, which however never
mede it upstream to the kernel. Andreas is no longer interested in working on
those actually because because of a long lack of interest by the Kernel
maintainers back in those days. In any case, NFS4 ACLs are the right name, even
if the SMB people don't like the "NFS" in the name.

We have a summary of the state of NFS4 ACLs here:
https://wiki.samba.org/index.php/NFS4_ACL_overview . I recommend taking a
closer look at this.

If cifs.ko would add a mapping of SMB ACLs to the corresponding system.nfs4_acl
EA, this would be nice already but It will only be a limited help if cifs.ko.

The NFS4 ACL model needs to be supported by the Linux kernel also to be really
helpful. The nfs4-acl-tools are there to manage NFS4 ACLs already. To become
really helpful for Linux NFS4 ACLs need to be managable natively and also be
supported with generic filesystems and tools.

I've seen people who abandon to use Linux as client machines because of the
lack of ACL managability. Have in mind that the so called POSIX ACLs are not a
standardized permission model. The POSIX ACLs never passed the status of a
draft standard and the only standardized ACL permission model are in fact the
NFS4 ACLs. One of the main reason why FreeNAS or TrueNAS these days are based
on FreeBSD is the lack of NFS4 ACLs also.

I really wonder why the responsible people in the Kernel developer community
ignore this important topic since so many years. Would be nice to see them join
this thread ...

Björn

