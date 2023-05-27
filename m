Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDA47131CA
	for <lists+samba-technical@lfdr.de>; Sat, 27 May 2023 03:50:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=LpZgqZg+kBm2WUGSX2QGnSQmGiuF2EmK2iiEE2sNjvI=; b=I0ZNLbzuwFydNaGYn1WFtCCBvo
	4nzoiiaT0OO9Q9ujGqzHFeYVEVZk1bmtgEpptqOXLxal5b+fKPMYKM0vJQCXtmraL32ld0mozdoOw
	yXIPTts7fmlnkaurdckbYtoZpyL65ae9Cy2q2k7ZiBrMAlkE/S0M76Hr6FpkInf5goUEfaoX61QQH
	pXN8s2SAljSFsN0UAVOkrwV+wvXExGrj3zYVrfYS//9vb5L6iaZPqe+OBwWiMAfRwmserf0WH2Yxr
	3oZf3TpjN1gbDksciQp0nhlVHMLZka2hSZvt1C1boevhSTpARoo8yTTiSXNEISyp90Tbt5Gak55I6
	4cYD6c2Q==;
Received: from ip6-localhost ([::1]:48886 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q2j4f-00CaRM-Hw; Sat, 27 May 2023 01:50:29 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:47180) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q2j4a-00CaRC-Jz
 for samba-technical@lists.samba.org; Sat, 27 May 2023 01:50:26 +0000
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2af2e908163so14175021fa.2
 for <samba-technical@lists.samba.org>; Fri, 26 May 2023 18:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685152220; x=1687744220;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LpZgqZg+kBm2WUGSX2QGnSQmGiuF2EmK2iiEE2sNjvI=;
 b=LQgnILsCXixQZtTvT+ryRMvHs3UxE5Nq/4qDlecOkcgzOr7k9AqdOk3oHQfP8IkH3+
 WfF4DvM9uCP8kuzyDAbmB2LyNb+OX1peiLnUfBy4G9xkvlDWORbLbEv1pebK9VNMwL/8
 Kgh44dh9r1Q1GpW5NyH7TAN49uRfrVtVIfqYQ/7IhRdPWi52e7fqvL5fsQpuJPS4IhiR
 Xo+Qhz+t6gDEnWCdv3WC6+DRov6FtUDq9bUX/WXOccqFczvq7Oez77JKjsyKJ/ymGppx
 PXa/J56v+zG3A/ChPPCrZQNN4BMo4Bziz4YGmXhCY1GPfEJzdUdn/LdzB+McVqaLxWQ3
 NNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685152220; x=1687744220;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LpZgqZg+kBm2WUGSX2QGnSQmGiuF2EmK2iiEE2sNjvI=;
 b=l0kRb6rVyxCLxat1vvMd+UjpH3FyDa+7fG3rFhvIpPyIt1b6JN3yUoraauGgKIOBBt
 AK1IM5xytkZsh83p9hr1DYTt2vMbdJm3T8VZCbJSJ0afZSaWFg6HuQGBUWGQiHbJEK8h
 sMA/im0d6L2pYC0YRFtQ1U5xZPx820E8Z7iohdRKCIT9363ZO/D9du7B6J2FY7hi5EIP
 qgQVoqwrWTEVo+c4HG5R4kZKSlJG1FOUgq8TP5OEoqI/Ozq02WGAtCfRdCjrKQmyO5AW
 eObQdah07a8XvrrtfKogVkEYKXbaMKp/2eUbPuuCmhI2bniMRnF3X88yrAXzgJjy5lQB
 jEew==
X-Gm-Message-State: AC+VfDyEaQa+RWpltl/I83d18kD9szpRTsCZEgrsZ+eeKAynvANfuBeO
 X2G/HDJ0KqI95RR4iUXlflhHugL70N6mscsoQpk=
X-Google-Smtp-Source: ACHHUZ6J4K6jBj99WDJdTSvvrEHHAo2uLG4cZLgBiDRh5Ya5WQ2ZJrzMoJ7wnsO9kPUDMEfCdd0KtpC5OHUWsMzraIY=
X-Received: by 2002:a2e:96da:0:b0:2af:1a58:2c83 with SMTP id
 d26-20020a2e96da000000b002af1a582c83mr1174678ljj.30.1685152220266; Fri, 26
 May 2023 18:50:20 -0700 (PDT)
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
 <CAH2r5muD89QUcaqWNQy5NUwyji9CinN_5kGcfFSQAbpJP5gn+A@mail.gmail.com>
In-Reply-To: <CAH2r5muD89QUcaqWNQy5NUwyji9CinN_5kGcfFSQAbpJP5gn+A@mail.gmail.com>
Date: Fri, 26 May 2023 20:50:08 -0500
Message-ID: <CAH2r5mt-8fwG5h=K0qBiKY4S-7YAcJYt2HtOgb_zOxVzRvROLw@mail.gmail.com>
Subject: Re: Displaying streams as xattrs
To: Steve French <smfrench@gmail.com>, Jeremy Allison <jra@samba.org>, 
 ronnie sahlberg <ronniesahlberg@gmail.com>, Christoph Hellwig <hch@lst.de>,
 CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 26, 2023 at 7:54=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
>
>
> On Fri, May 26, 2023, 06:03 Bj=C3=B6rn JACKE <bj@sernet.de> wrote:
>>
>> On 2023-05-25 at 18:50 -0500 Steve French via samba-technical sent off:
>> > Today the "RichACLs" can be displayed multiple ways (e.g. "getcifsacl"
>> > and various other
>> > tools and also via system xattrs).
>> > Being able to display "RichACLs" makes sense - and I am fine with
>> > mapping these (and
>> > probably would make sense to at least have a readonly mapping of the
>> > existing richacls on
>> > a file to "posixacl") and RichACLs are very important.
>> >
>> > Wouldn't it be easier to let them also be queried for cifs.ko via
>> > "system.getrichacl" (or whatever
>> > the "getrichacl" tool used in various xfstests uses)?
>> >
>> > I was also wondering how we should display (and how to retrieve via
>> > SMB3) "claims based ACLs" (presumably these are reasonably common on a
>> > few server types like Windows)?
>>
>> let's stop calling them RichACLs becuase that was only the name that And=
reas
>> Gr=C3=BCnbacher was giving his implementation of the NFS4 ACLs

The name "richacls" looks like it is embedded in the standard
filesystem functional tests
(to pass xfstests generic/362 through generic/370 requires this - so I
would have to finish
off the mapping of this richacl pseudo-xattr query to the SMB3.1.1 get
acl query over the wire).
It doesn't look too bad, and it would.   Most users would probably use
the normal
tools (like getcifsacl or even Samba's "smbcacls" user space tool or
the pseudo-xattr
e.g. system.cifs_ntsd_full) but if it helps to use a common format
that helps ntfs and nfsv4.1 and later
that is fine with me.


> Remember that at Connectathon conferences years ago when nfs4.1 ACLS were=
 explained  (fixing NFS 4 ACLS to address some missed things). The NFS ACL =
ideas were modelled after smb ACLs so NFS ACLs have many similarities to th=
eir predecessor SMB ACLs (although presumably do not support claims based A=
CEs/CBAC/DAC yet)



--=20
Thanks,

Steve

