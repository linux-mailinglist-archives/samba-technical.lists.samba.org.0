Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 01615154FC7
	for <lists+samba-technical@lfdr.de>; Fri,  7 Feb 2020 01:35:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZL3/oebDaCZaZmD2f0fcYZVXDdD62A31uvm8GzpJpdc=; b=rLIBG+hR69uhiiaB0x9OXrBMJe
	f9ltgfkEIPrFs/xFhHGcrs8nMXHu/KVBk3+OcVUryuyuSKwVUwHRqdShFYeQghz7QW3GB2Om7yPMG
	t1oZkbZYoTM5X/yyHxVbvKoijqH5M8Zqu26r7p/RoZAfwUzptgx4OZwf1+kmlIRfzJl4r7hm/zy1w
	x/dGMzvnHQLz+UrGOrNn+p42Wr5++ySml/EzKW7tq/wxXtvOrqzFoNpd4eIwMV0VYhGJCQ5uuDww+
	0zE9pSZUf1Il+GAlHG4LjgS/JJBsLX/JFQBmV1Yp5FSn8jU85nI3k2XqzLJQTeaT5EBVLxKTKZdnE
	A0No+hLQ==;
Received: from localhost ([::1]:51734 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1izrbS-008XrH-RU; Fri, 07 Feb 2020 00:34:38 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:46193) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1izrbO-008XrA-Qc
 for samba-technical@lists.samba.org; Fri, 07 Feb 2020 00:34:37 +0000
Received: by mail-io1-xd41.google.com with SMTP id t26so185580ioi.13
 for <samba-technical@lists.samba.org>; Thu, 06 Feb 2020 16:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZL3/oebDaCZaZmD2f0fcYZVXDdD62A31uvm8GzpJpdc=;
 b=LpvPdS1DplYt6cW0DEl/6O1Ryar2GRW+2ekUTfetVtCbN6b6J7fOQdA3KBaBl2IngD
 nJWBWtzb86NfB1V9BGHMPMYC3cC+GGhhGxYVyYvDuZJUrGwLCy7UYtee6GuBnN/or64z
 ZjKzMEu+oqgkLCAeMIvPW7tXfLczY4L/8ihU9IA2f3yZ8VXjimGpNL5+J5dgqreeAJkW
 pqBuyMwkSIiFZpbYZz1aQEqZirIOegOS+LmQQJ6KPVY45O4LB/wNXSWk1aNkA0LHh3p3
 DZBn/zQW+UODFuUMbBv0Dpd8KeH+ws9GJMln0aGw+DHvHAKb+KFSnW1K58m2ykM8TPgF
 NDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZL3/oebDaCZaZmD2f0fcYZVXDdD62A31uvm8GzpJpdc=;
 b=gP0VD7y1jWXPDlSCk0cllGoalJQ2JGyQmnW4FouRd3WypZc/Mo7JJ3U1kSuNS3kTL1
 4NtQXMUnqv7VALLjwxRBvEAKN2XV7cuBN2MBv4uVKMHW80g33gEIQByZ3AN7gtpKaDcf
 fHlOW3RfwFb73gXNVPTzwxDa9ySJje4rwhM4ydMrbePOrX+1UA6yESMrur9DU3dCAwtn
 FP8sInSugFVzVGWIUZlEmaaJVO0ZzIxM34n7FcWVsTa1l1wS2ryteFgSBMMmMsYA74Gl
 E3TYVkrZH098tVpP6ZfhaHs2TNYB+lEriah4GDMMvhLOBVeWFtZiDfl46jVkIpVx9f2r
 YIXg==
X-Gm-Message-State: APjAAAUHZTdQxgpxPx5grVw9DXJhCgKS19Vgek81WmlBxT+F+3kYJkQT
 eMoEOlgcMA5P/VCoXm8gEgA4s0btGvVvGTrPPxI=
X-Google-Smtp-Source: APXvYqyyTggiju1Y3Vtk1u2yj2l8ktJHDrRafg2cRgLPmNDssUQkpWtJumKZuuwVBNG3f2Zgur+4KtvDJIwmRoFJmPM=
X-Received: by 2002:a5d:9cc7:: with SMTP id w7mr763709iow.159.1581035671047;
 Thu, 06 Feb 2020 16:34:31 -0800 (PST)
MIME-Version: 1.0
References: <202002070617.AbeYy9qc%lkp@intel.com>
 <CAH2r5mtHY6OGMpMdpLcxZ_xyjzZHANhqr_NoeGERiFiQyfc-PQ@mail.gmail.com>
 <CAN05THQ8ajLM58-dyQA0teD56Hkt7wmJMRtHB8DW1Yh5qKBrjg@mail.gmail.com>
 <CAH2r5mvtYcc+=bKApMsb=Cg2VgiwPoEfV92cncfhFswjBmkKFw@mail.gmail.com>
In-Reply-To: <CAH2r5mvtYcc+=bKApMsb=Cg2VgiwPoEfV92cncfhFswjBmkKFw@mail.gmail.com>
Date: Fri, 7 Feb 2020 10:34:19 +1000
Message-ID: <CAN05THQJBQiT5k4AUQcDtp=QkTnxjf3kiPnRmxMb7BCiDRsMaQ@mail.gmail.com>
Subject: Re: [cifs:for-next 10/11] fs/cifs/smb2pdu.c:1985:38: error: macro
 "memcmp" passed 18 arguments, but takes just 3
To: Steve French <smfrench@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 kbuild test robot <lkp@intel.com>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Looks good to me.
Reviewed-by: Ronnie Sahlberg <lsahlber@redhat.com>

On Fri, Feb 7, 2020 at 9:33 AM Steve French <smfrench@gmail.com> wrote:
>
> ok - changed as suggested. Tested out ok
>
> See attached.
>
> On Thu, Feb 6, 2020 at 5:16 PM ronnie sahlberg <ronniesahlberg@gmail.com> wrote:
> >
> > It is probably that m68k lage quite behind in GCC versions and
> > probably that compiler can not handle this construct:
> > > 1983                          if (memcmp(name, (char []) {0x93, 0xAD, 0x25, 0x50,
> >   1984                                  0x9C, 0xB4, 0x11, 0xE7, 0xB4,
> > 0x23, 0x83,
> > > 1985                                  0xDE, 0x96, 0x8B, 0xCD, 0x7C}, 16) == 0)
> > and you would probably need something like this:
> >      const char foo[] = {0x93, 0xAD, 0x25, 0x50, 0x9C, 0xB4, 0x11,
> > 0xE7, 0xB4, 0x23, 0x83, 0xDE, 0x96, 0x8B, 0xCD, 0x7C};
> >      if (memcmp(name, foo, sizeof(foo)) == 0)
> > ...
> >
> > On Fri, Feb 7, 2020 at 8:48 AM Steve French <smfrench@gmail.com> wrote:
> > >
> > > It compiled and tested ok.  Is this warning a limitation of the kbuild robot?
> > >
> > > On Thu, Feb 6, 2020 at 4:26 PM kbuild test robot <lkp@intel.com> wrote:
> > > >
> > > > tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> > > > head:   58b322cfd219fd570d4fcc2e2eb8b5d945389d46
> > > > commit: 3d9d8c48232a668ada5f680f70c8b3d366629ab6 [10/11] smb3: print warning once if posix context returned on open
> > > > config: m68k-multi_defconfig (attached as .config)
> > > > compiler: m68k-linux-gcc (GCC) 7.5.0
> > > > reproduce:
> > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > >         chmod +x ~/bin/make.cross
> > > >         git checkout 3d9d8c48232a668ada5f680f70c8b3d366629ab6
> > > >         # save the attached .config to linux build tree
> > > >         GCC_VERSION=7.5.0 make.cross ARCH=m68k
> > > >
> > > > If you fix the issue, kindly add following tag
> > > > Reported-by: kbuild test robot <lkp@intel.com>
> > > >
> > > > All errors (new ones prefixed by >>):
> > > >
> > > >    fs/cifs/smb2pdu.c: In function 'smb2_parse_contexts':
> > > > >> fs/cifs/smb2pdu.c:1985:38: error: macro "memcmp" passed 18 arguments, but takes just 3
> > > >         0xDE, 0x96, 0x8B, 0xCD, 0x7C}, 16) == 0)
> > > >                                          ^
> > > > >> fs/cifs/smb2pdu.c:1983:8: error: 'memcmp' undeclared (first use in this function); did you mean 'memchr'?
> > > >        if (memcmp(name, (char []) {0x93, 0xAD, 0x25, 0x50,
> > > >            ^~~~~~
> > > >            memchr
> > > >    fs/cifs/smb2pdu.c:1983:8: note: each undeclared identifier is reported only once for each function it appears in
> > > >
> > > > vim +/memcmp +1985 fs/cifs/smb2pdu.c
> > > >
> > > >   1951
> > > >   1952  void
> > > >   1953  smb2_parse_contexts(struct TCP_Server_Info *server,
> > > >   1954                         struct smb2_create_rsp *rsp,
> > > >   1955                         unsigned int *epoch, char *lease_key, __u8 *oplock,
> > > >   1956                         struct smb2_file_all_info *buf)
> > > >   1957  {
> > > >   1958          char *data_offset;
> > > >   1959          struct create_context *cc;
> > > >   1960          unsigned int next;
> > > >   1961          unsigned int remaining;
> > > >   1962          char *name;
> > > >   1963
> > > >   1964          *oplock = 0;
> > > >   1965          data_offset = (char *)rsp + le32_to_cpu(rsp->CreateContextsOffset);
> > > >   1966          remaining = le32_to_cpu(rsp->CreateContextsLength);
> > > >   1967          cc = (struct create_context *)data_offset;
> > > >   1968
> > > >   1969          /* Initialize inode number to 0 in case no valid data in qfid context */
> > > >   1970          if (buf)
> > > >   1971                  buf->IndexNumber = 0;
> > > >   1972
> > > >   1973          while (remaining >= sizeof(struct create_context)) {
> > > >   1974                  name = le16_to_cpu(cc->NameOffset) + (char *)cc;
> > > >   1975                  if (le16_to_cpu(cc->NameLength) == 4 &&
> > > >   1976                      strncmp(name, SMB2_CREATE_REQUEST_LEASE, 4) == 0)
> > > >   1977                          *oplock = server->ops->parse_lease_buf(cc, epoch,
> > > >   1978                                                             lease_key);
> > > >   1979                  else if (buf && (le16_to_cpu(cc->NameLength) == 4) &&
> > > >   1980                      strncmp(name, SMB2_CREATE_QUERY_ON_DISK_ID, 4) == 0)
> > > >   1981                          parse_query_id_ctxt(cc, buf);
> > > >   1982                  else if ((le16_to_cpu(cc->NameLength) == 16)) {
> > > > > 1983                          if (memcmp(name, (char []) {0x93, 0xAD, 0x25, 0x50,
> > > >   1984                                  0x9C, 0xB4, 0x11, 0xE7, 0xB4, 0x23, 0x83,
> > > > > 1985                                  0xDE, 0x96, 0x8B, 0xCD, 0x7C}, 16) == 0)
> > > >   1986                                  parse_posix_ctxt(cc, NULL);
> > > >   1987                  }
> > > >   1988                  /* else {
> > > >   1989                          cifs_dbg(FYI, "Context not matched with len %d\n",
> > > >   1990                                  le16_to_cpu(cc->NameLength));
> > > >   1991                          cifs_dump_mem("Cctxt name: ", name, 4);
> > > >   1992                  } */
> > > >   1993
> > > >   1994                  next = le32_to_cpu(cc->Next);
> > > >   1995                  if (!next)
> > > >   1996                          break;
> > > >   1997                  remaining -= next;
> > > >   1998                  cc = (struct create_context *)((char *)cc + next);
> > > >   1999          }
> > > >   2000
> > > >   2001          if (rsp->OplockLevel != SMB2_OPLOCK_LEVEL_LEASE)
> > > >   2002                  *oplock = rsp->OplockLevel;
> > > >   2003
> > > >   2004          return;
> > > >   2005  }
> > > >   2006
> > > >
> > > > ---
> > > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> > >
> > >
> > >
> > > --
> > > Thanks,
> > >
> > > Steve
>
>
>
> --
> Thanks,
>
> Steve

