Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 93929154F67
	for <lists+samba-technical@lfdr.de>; Fri,  7 Feb 2020 00:34:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Sgyy7/Zrs0qFKK9f9lC1Jcaby4DM88vXrMj3WQXVHTM=; b=T3LzOLg4OXTB/e1D7JdDzUYoQB
	uRbZWYrMSyV01dPU7HlnEzY0KEnCv++4bNEQEE57eOJXUoQNXr6+4jwMhWgdY4foDUrXPwjuyuzB2
	UwVkeC664VOhHwjfXaC9jH137h2zu6cLxTYK51jltDwDCi3MNDrw8cL8oOEsIBMeh98MgP9zgtzab
	95raKjYPoVDEZrj11WeCTmkAIJTAJCh1ytaznr3kjVt9uhbeQ1Wg5+IR+EIqLLoef8lkycUym4Q2E
	W7JSFuMzKCMjgtA/2RiOZzuoqXolIRycDMWZHDmhESXpxMVml3XnMLDDcd5mXLRV6HEX/p216fC3K
	2JbXPXdA==;
Received: from localhost ([::1]:50242 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1izqel-008XYx-O7; Thu, 06 Feb 2020 23:33:59 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:43051) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1izqeZ-008XYq-Uk
 for samba-technical@lists.samba.org; Thu, 06 Feb 2020 23:33:56 +0000
Received: by mail-il1-x144.google.com with SMTP id o13so163593ilg.10
 for <samba-technical@lists.samba.org>; Thu, 06 Feb 2020 15:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sgyy7/Zrs0qFKK9f9lC1Jcaby4DM88vXrMj3WQXVHTM=;
 b=murGZpPnHCq+diIg+uiMYkm9d2If3fLKA+S+uzW4uhJSJ2su/JVBXInkuqC3seNc1V
 QTaIyNrPcYaM26xUbEWcNC3rReQIot7UixXhB00VxFVQQ7TTXVCv2mWrJeHPkeCsNKRi
 du7tjJ0sf6X8eACK32C4IA+HEEj1cnTEo7kXYI9HJKee6EGHlBDP4eHCNqb0zh3dP4qJ
 X/OdBfNWQueYmznndqVUjqoAMHgbYKwkO0djj5NlzX5TdmJqNuY9aggHFYPosXoA1Qer
 uJP4ZV9GTndCS6+yuhqVkD8jY2ueGUqVP9aAbTVqPdQRtIJ5vsH0li3molYxSreZkbn6
 6iDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sgyy7/Zrs0qFKK9f9lC1Jcaby4DM88vXrMj3WQXVHTM=;
 b=Xo6jK1NYQtgLph7gNhFVtBFDXxpWH3Gd/yYaohQh5XRhpm3OOiX5//aFQCVXoHCu/3
 tj5qO6qcTz36qRp+S5tBWo1RcmnCVnMrnsskw5BWThR06ZGkzM4W1UWOE27GZDU2ar+S
 unN3DtWRlOT+txv09A9ULh88sCBxifO5NEj+0D4B2zQP5OmZ1jN8xRcwZhP/2qa27j1I
 c4DSJMZdPRMxoQCm6t2AL1AO/fBXqaN/Gpyy+1n0hLzZVFprRHpcaZ1UGVtp9yqdl58Q
 syZsxS/2TV3Og1Cvvr1gP4LKc/FTabEHp07YkBhSxYZjM2BpHh4vEyXg/lOyA11cjujA
 gkSg==
X-Gm-Message-State: APjAAAUKFH0AAIbEeOoBWQS/68uesGPOxGgHiMFH57lSWJxtIkoFWjhp
 xomFZgNxHoN1abkkJuFi4jbXMI7FyuN78I5ruLU=
X-Google-Smtp-Source: APXvYqwRxzoBffx+wmJaP/pKghAN7YDmcZccRvQH4BTWpgr2TgsKzeaamJosV2vKK0I7cCEs1sQtT0mZ5rfHz6/pZgU=
X-Received: by 2002:a92:9f1b:: with SMTP id u27mr6657280ili.173.1581032026126; 
 Thu, 06 Feb 2020 15:33:46 -0800 (PST)
MIME-Version: 1.0
References: <202002070617.AbeYy9qc%lkp@intel.com>
 <CAH2r5mtHY6OGMpMdpLcxZ_xyjzZHANhqr_NoeGERiFiQyfc-PQ@mail.gmail.com>
 <CAN05THQ8ajLM58-dyQA0teD56Hkt7wmJMRtHB8DW1Yh5qKBrjg@mail.gmail.com>
In-Reply-To: <CAN05THQ8ajLM58-dyQA0teD56Hkt7wmJMRtHB8DW1Yh5qKBrjg@mail.gmail.com>
Date: Thu, 6 Feb 2020 17:33:34 -0600
Message-ID: <CAH2r5mvtYcc+=bKApMsb=Cg2VgiwPoEfV92cncfhFswjBmkKFw@mail.gmail.com>
Subject: Re: [cifs:for-next 10/11] fs/cifs/smb2pdu.c:1985:38: error: macro
 "memcmp" passed 18 arguments, but takes just 3
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Content-Type: multipart/mixed; boundary="0000000000004c57d8059df0b478"
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 kbuild test robot <lkp@intel.com>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000004c57d8059df0b478
Content-Type: text/plain; charset="UTF-8"

ok - changed as suggested. Tested out ok

See attached.

On Thu, Feb 6, 2020 at 5:16 PM ronnie sahlberg <ronniesahlberg@gmail.com> wrote:
>
> It is probably that m68k lage quite behind in GCC versions and
> probably that compiler can not handle this construct:
> > 1983                          if (memcmp(name, (char []) {0x93, 0xAD, 0x25, 0x50,
>   1984                                  0x9C, 0xB4, 0x11, 0xE7, 0xB4,
> 0x23, 0x83,
> > 1985                                  0xDE, 0x96, 0x8B, 0xCD, 0x7C}, 16) == 0)
> and you would probably need something like this:
>      const char foo[] = {0x93, 0xAD, 0x25, 0x50, 0x9C, 0xB4, 0x11,
> 0xE7, 0xB4, 0x23, 0x83, 0xDE, 0x96, 0x8B, 0xCD, 0x7C};
>      if (memcmp(name, foo, sizeof(foo)) == 0)
> ...
>
> On Fri, Feb 7, 2020 at 8:48 AM Steve French <smfrench@gmail.com> wrote:
> >
> > It compiled and tested ok.  Is this warning a limitation of the kbuild robot?
> >
> > On Thu, Feb 6, 2020 at 4:26 PM kbuild test robot <lkp@intel.com> wrote:
> > >
> > > tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> > > head:   58b322cfd219fd570d4fcc2e2eb8b5d945389d46
> > > commit: 3d9d8c48232a668ada5f680f70c8b3d366629ab6 [10/11] smb3: print warning once if posix context returned on open
> > > config: m68k-multi_defconfig (attached as .config)
> > > compiler: m68k-linux-gcc (GCC) 7.5.0
> > > reproduce:
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         git checkout 3d9d8c48232a668ada5f680f70c8b3d366629ab6
> > >         # save the attached .config to linux build tree
> > >         GCC_VERSION=7.5.0 make.cross ARCH=m68k
> > >
> > > If you fix the issue, kindly add following tag
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    fs/cifs/smb2pdu.c: In function 'smb2_parse_contexts':
> > > >> fs/cifs/smb2pdu.c:1985:38: error: macro "memcmp" passed 18 arguments, but takes just 3
> > >         0xDE, 0x96, 0x8B, 0xCD, 0x7C}, 16) == 0)
> > >                                          ^
> > > >> fs/cifs/smb2pdu.c:1983:8: error: 'memcmp' undeclared (first use in this function); did you mean 'memchr'?
> > >        if (memcmp(name, (char []) {0x93, 0xAD, 0x25, 0x50,
> > >            ^~~~~~
> > >            memchr
> > >    fs/cifs/smb2pdu.c:1983:8: note: each undeclared identifier is reported only once for each function it appears in
> > >
> > > vim +/memcmp +1985 fs/cifs/smb2pdu.c
> > >
> > >   1951
> > >   1952  void
> > >   1953  smb2_parse_contexts(struct TCP_Server_Info *server,
> > >   1954                         struct smb2_create_rsp *rsp,
> > >   1955                         unsigned int *epoch, char *lease_key, __u8 *oplock,
> > >   1956                         struct smb2_file_all_info *buf)
> > >   1957  {
> > >   1958          char *data_offset;
> > >   1959          struct create_context *cc;
> > >   1960          unsigned int next;
> > >   1961          unsigned int remaining;
> > >   1962          char *name;
> > >   1963
> > >   1964          *oplock = 0;
> > >   1965          data_offset = (char *)rsp + le32_to_cpu(rsp->CreateContextsOffset);
> > >   1966          remaining = le32_to_cpu(rsp->CreateContextsLength);
> > >   1967          cc = (struct create_context *)data_offset;
> > >   1968
> > >   1969          /* Initialize inode number to 0 in case no valid data in qfid context */
> > >   1970          if (buf)
> > >   1971                  buf->IndexNumber = 0;
> > >   1972
> > >   1973          while (remaining >= sizeof(struct create_context)) {
> > >   1974                  name = le16_to_cpu(cc->NameOffset) + (char *)cc;
> > >   1975                  if (le16_to_cpu(cc->NameLength) == 4 &&
> > >   1976                      strncmp(name, SMB2_CREATE_REQUEST_LEASE, 4) == 0)
> > >   1977                          *oplock = server->ops->parse_lease_buf(cc, epoch,
> > >   1978                                                             lease_key);
> > >   1979                  else if (buf && (le16_to_cpu(cc->NameLength) == 4) &&
> > >   1980                      strncmp(name, SMB2_CREATE_QUERY_ON_DISK_ID, 4) == 0)
> > >   1981                          parse_query_id_ctxt(cc, buf);
> > >   1982                  else if ((le16_to_cpu(cc->NameLength) == 16)) {
> > > > 1983                          if (memcmp(name, (char []) {0x93, 0xAD, 0x25, 0x50,
> > >   1984                                  0x9C, 0xB4, 0x11, 0xE7, 0xB4, 0x23, 0x83,
> > > > 1985                                  0xDE, 0x96, 0x8B, 0xCD, 0x7C}, 16) == 0)
> > >   1986                                  parse_posix_ctxt(cc, NULL);
> > >   1987                  }
> > >   1988                  /* else {
> > >   1989                          cifs_dbg(FYI, "Context not matched with len %d\n",
> > >   1990                                  le16_to_cpu(cc->NameLength));
> > >   1991                          cifs_dump_mem("Cctxt name: ", name, 4);
> > >   1992                  } */
> > >   1993
> > >   1994                  next = le32_to_cpu(cc->Next);
> > >   1995                  if (!next)
> > >   1996                          break;
> > >   1997                  remaining -= next;
> > >   1998                  cc = (struct create_context *)((char *)cc + next);
> > >   1999          }
> > >   2000
> > >   2001          if (rsp->OplockLevel != SMB2_OPLOCK_LEVEL_LEASE)
> > >   2002                  *oplock = rsp->OplockLevel;
> > >   2003
> > >   2004          return;
> > >   2005  }
> > >   2006
> > >
> > > ---
> > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> >
> >
> >
> > --
> > Thanks,
> >
> > Steve



-- 
Thanks,

Steve

--0000000000004c57d8059df0b478
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-print-warning-once-if-posix-context-returned-on.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-print-warning-once-if-posix-context-returned-on.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k6bdmt7c0>
X-Attachment-Id: f_k6bdmt7c0

RnJvbSBhYjM0NTlkOGYwZWY1MmMzODExOWVkNThjNGMyOTEzOWVmYzcwMjJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFRodSwgNiBGZWIgMjAyMCAxNzozMTo1NiAtMDYwMApTdWJqZWN0OiBbUEFUQ0ggMS8y
XSAgc21iMzogcHJpbnQgd2FybmluZyBvbmNlIGlmIHBvc2l4IGNvbnRleHQgcmV0dXJuZWQgb24K
IG9wZW4KClNNQjMuMS4xIFBPU0lYIENvbnRleHQgcHJvY2Vzc2luZyBpcyBub3QgY29tcGxldGUg
eWV0IC0gc28gcHJpbnQgd2FybmluZwoob25jZSkgaWYgc2VydmVyIHJldHVybnMgaXQgb24gb3Bl
bi4KClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4K
UmV2aWV3ZWQtYnk6IEF1cmVsaWVuIEFwdGVsIDxhYXB0ZWxAc3VzZS5jb20+Ci0tLQogZnMvY2lm
cy9zbWIycGR1LmMgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCiBmcy9jaWZzL3NtYjJwZHUu
aCB8ICA4ICsrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9mcy9jaWZzL3NtYjJwZHUuYyBiL2ZzL2NpZnMvc21iMnBkdS5jCmluZGV4IDQ3Y2Nl
MGJkMWFmZS4uMTIzNGY5Y2NhYjAzIDEwMDY0NAotLS0gYS9mcy9jaWZzL3NtYjJwZHUuYworKysg
Yi9mcy9jaWZzL3NtYjJwZHUuYwpAQCAtMTkzOSw2ICsxOTM5LDE2IEBAIHBhcnNlX3F1ZXJ5X2lk
X2N0eHQoc3RydWN0IGNyZWF0ZV9jb250ZXh0ICpjYywgc3RydWN0IHNtYjJfZmlsZV9hbGxfaW5m
byAqYnVmKQogCWJ1Zi0+SW5kZXhOdW1iZXIgPSBwZGlza19pZC0+RGlza0ZpbGVJZDsKIH0KIAor
c3RhdGljIHZvaWQKK3BhcnNlX3Bvc2l4X2N0eHQoc3RydWN0IGNyZWF0ZV9jb250ZXh0ICpjYywg
c3RydWN0IHNtYl9wb3NpeF9pbmZvICpwcG9zaXhfaW5mKQoreworCS8qIHN0cnVjdCBzbWJfcG9z
aXhfaW5mbyAqcHBpbmYgPSAoc3RydWN0IHNtYl9wb3NpeF9pbmZvICopY2M7ICovCisKKwkvKiBU
T0RPOiBOZWVkIHRvIGFkZCBwYXJzaW5nIGZvciB0aGUgY29udGV4dCBhbmQgcmV0dXJuICovCisJ
cHJpbnRrX29uY2UoS0VSTl9XQVJOSU5HCisJCSAgICAiU01CMyAzLjExIFBPU0lYIHJlc3BvbnNl
IGNvbnRleHQgbm90IGNvbXBsZXRlZCB5ZXRcbiIpOworfQorCiB2b2lkCiBzbWIyX3BhcnNlX2Nv
bnRleHRzKHN0cnVjdCBUQ1BfU2VydmVyX0luZm8gKnNlcnZlciwKIAkJICAgICAgIHN0cnVjdCBz
bWIyX2NyZWF0ZV9yc3AgKnJzcCwKQEAgLTE5NTAsNiArMTk2MCw5IEBAIHNtYjJfcGFyc2VfY29u
dGV4dHMoc3RydWN0IFRDUF9TZXJ2ZXJfSW5mbyAqc2VydmVyLAogCXVuc2lnbmVkIGludCBuZXh0
OwogCXVuc2lnbmVkIGludCByZW1haW5pbmc7CiAJY2hhciAqbmFtZTsKKwljb25zdCBjaGFyIHNt
YjNfY3JlYXRlX3RhZ19wb3NpeFtdID0gezB4OTMsIDB4QUQsIDB4MjUsIDB4NTAsIDB4OUMsCisJ
CQkJCTB4QjQsIDB4MTEsIDB4RTcsIDB4QjQsIDB4MjMsIDB4ODMsCisJCQkJCTB4REUsIDB4OTYs
IDB4OEIsIDB4Q0QsIDB4N0N9OwogCiAJKm9wbG9jayA9IDA7CiAJZGF0YV9vZmZzZXQgPSAoY2hh
ciAqKXJzcCArIGxlMzJfdG9fY3B1KHJzcC0+Q3JlYXRlQ29udGV4dHNPZmZzZXQpOwpAQCAtMTk2
OSw2ICsxOTgyLDE1IEBAIHNtYjJfcGFyc2VfY29udGV4dHMoc3RydWN0IFRDUF9TZXJ2ZXJfSW5m
byAqc2VydmVyLAogCQllbHNlIGlmIChidWYgJiYgKGxlMTZfdG9fY3B1KGNjLT5OYW1lTGVuZ3Ro
KSA9PSA0KSAmJgogCQkgICAgc3RybmNtcChuYW1lLCBTTUIyX0NSRUFURV9RVUVSWV9PTl9ESVNL
X0lELCA0KSA9PSAwKQogCQkJcGFyc2VfcXVlcnlfaWRfY3R4dChjYywgYnVmKTsKKwkJZWxzZSBp
ZiAoKGxlMTZfdG9fY3B1KGNjLT5OYW1lTGVuZ3RoKSA9PSAxNikpIHsKKwkJCWlmIChtZW1jbXAo
bmFtZSwgc21iM19jcmVhdGVfdGFnX3Bvc2l4LCAxNikgPT0gMCkKKwkJCQlwYXJzZV9wb3NpeF9j
dHh0KGNjLCBOVUxMKTsKKwkJfQorCQkvKiBlbHNlIHsKKwkJCWNpZnNfZGJnKEZZSSwgIkNvbnRl
eHQgbm90IG1hdGNoZWQgd2l0aCBsZW4gJWRcbiIsCisJCQkJbGUxNl90b19jcHUoY2MtPk5hbWVM
ZW5ndGgpKTsKKwkJCWNpZnNfZHVtcF9tZW0oIkNjdHh0IG5hbWU6ICIsIG5hbWUsIDQpOworCQl9
ICovCiAKIAkJbmV4dCA9IGxlMzJfdG9fY3B1KGNjLT5OZXh0KTsKIAkJaWYgKCFuZXh0KQpkaWZm
IC0tZ2l0IGEvZnMvY2lmcy9zbWIycGR1LmggYi9mcy9jaWZzL3NtYjJwZHUuaAppbmRleCA0YzQz
ZGJkMWUwODkuLmNhMjEyM2Q3ZjE5OSAxMDA2NDQKLS0tIGEvZnMvY2lmcy9zbWIycGR1LmgKKysr
IGIvZnMvY2lmcy9zbWIycGR1LmgKQEAgLTE1OTUsNCArMTU5NSwxMiBAQCBzdHJ1Y3Qgc21iMl9m
aWxlX25ldHdvcmtfb3Blbl9pbmZvIHsKIAogZXh0ZXJuIGNoYXIgc21iMl9wYWRkaW5nWzddOwog
CisvKiBlcXVpdmFsZW50IG9mIHRoZSBjb250ZW50cyBvZiBTTUIzLjEuMSBQT1NJWCBvcGVuIGNv
bnRleHQgcmVzcG9uc2UgKi8KK3N0cnVjdCBzbWJfcG9zaXhfaW5mbyB7CisJX19sZTMyIG5saW5r
OworCV9fbGUzMiByZXBhcnNlX3RhZzsKKwlfX2xlMzIgbW9kZTsKKwlrdWlkX3QJdWlkOworCWt1
aWRfdAlnaWQ7Cit9OwogI2VuZGlmCQkJCS8qIF9TTUIyUERVX0ggKi8KLS0gCjIuMjAuMQoK
--0000000000004c57d8059df0b478--

