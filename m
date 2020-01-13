Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F465139ACC
	for <lists+samba-technical@lfdr.de>; Mon, 13 Jan 2020 21:36:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=JNKUuHInooF9ZI3fIFoHcMxkLm77ZEkAj3bulBvDOQE=; b=zQxQcCBvU6c/LTpJG7BjuKpbev
	vhzzbxCKcygdEGN5aP61tztvs1wKEwnssadGSi2o3fM1+7JzuoU5wkDqy3yKvBA9kstUtCiZOjreJ
	2bW8wn2b14yZMhj9jsZ5RwbVwlWOEn0MtDe3LbS+xtl/4+1zI6OkeQtG9cRJaCHiiBbXcrnrAC4FF
	4XN6iZlTplJZIqlvrBFDPqUNom3Id0v9zRfqmLpNttLgLjvYrYj8BlgqWMuYg7TeTESA3j9DBqXXI
	Eo9BjPmMLFz4YzEzdJYpPRFiM+MAoo27MDInyLeXxNJh5l16oxjoey1W8+oJ13IlGg0KOueQXJMl/
	gJ0KOurw==;
Received: from localhost ([::1]:56380 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ir6Rl-003I2X-Bu; Mon, 13 Jan 2020 20:36:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35588) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ir6Ri-003I2Q-0H
 for samba-technical@lists.samba.org; Mon, 13 Jan 2020 20:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=JNKUuHInooF9ZI3fIFoHcMxkLm77ZEkAj3bulBvDOQE=; b=ZyawoKgBGqgc9wfBvamZTettCB
 FfagFfjTRczYIJAo1y5ZOcioVTbSKZ6FmwfoDxu7ui7sXRQ3WoWbAof3MUj5wTnlspl59KmOLvR5N
 7UKgofrhgmqutPhUyxZREe8VwMZzLv5/9SDd761M7CeYogMbVUAk7v/SB495dLqJeZFp+t4CBPfc4
 PjEkbSOlVRiOyhkd1ddKrXsPwmutgd+ze9JNhgIXRUCaekzPb948JhI8r791gAzbGN2qWacDjV6x9
 Im9Z76Tp0s56gDihN9tm8B7WN7lDtwiu6/jxX7KJZlhMoOK1UimpkU2fAKdA782wZePiCSb8+h8mQ
 hg0uHzCA71vbsosGAZCG8rPkK2s/spH5GoM6KrfbHXd67D8AQ2FqNYCLpnOCfX+wUMQUgboFLV6xD
 PQTPbmLvBYy4EMY1MzjFmgnK8KyzT1wO5IgRkued5SftXQx1G9FAc0ZYnG4F1O1hPnfe48aKBUCbz
 pCdiL0QBmKkKPm5EyNQCiteT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ir6Rc-0002NT-P4; Mon, 13 Jan 2020 20:36:17 +0000
Date: Mon, 13 Jan 2020 12:36:13 -0800
To: Andreas Dilger <adilger@dilger.ca>
Subject: Re: [PATCH] Add support for setting owner info, dos attributes, and
 create time
Message-ID: <20200113203613.GA111855@jra4>
References: <20191219165250.2875-1-bprotopopov@hotmail.com>
 <CAH2r5mu0Jd=MACMn6_KPvNWoAPVu+V_3FOnoEZxDWoy0x2qEzA@mail.gmail.com>
 <780DD595-1F92-4C34-A323-BB32748E5D07@dilger.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <780DD595-1F92-4C34-A323-BB32748E5D07@dilger.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 Boris Protopopov <boris.v.protopopov@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 David Howells <dhowells@redhat.com>, Steve French <smfrench@gmail.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jan 13, 2020 at 01:26:39PM -0700, Andreas Dilger via samba-technical wrote:
> On Jan 9, 2020, at 12:10 PM, Steve French <smfrench@gmail.com> wrote:
> > 
> > One loosely related question ...
> > 
> > Your patch adds the ability to set creation time (birth time) which
> > can be useful for backup/restore cases, but doesn't address the other
> > hole in Linux (the inability to restore a files ctime).
> > 
> > In Linux the ability to set timestamps seems quite limited (utimes
> > only allows setting mtime and atime).
> 
> The whole point of not being able to change ctime and btime as a regular
> user is so that it is possible to determine when a file was actually
> created on the filesystem and last modified.  That is often useful for
> debugging or forensics reasons.
> 
> I think if this is something that SMB/CIFS wants to do, it should save
> these attributes into an xattr of its own (e.g. user.dos or whatever),
> rather than using the ctime and btime(crtime) fields in the filesystem.

FYI, we (Samba) already do this for create time to store/fetch it
on systems and filesystems that don't store a create time. It's
easy to add extra info here.

