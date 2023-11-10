Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 338DA7E79A7
	for <lists+samba-technical@lfdr.de>; Fri, 10 Nov 2023 08:10:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=YJP5qTRtuZcVZvUNSgHKo7QSwb9ciHUra42VIGSwBpg=; b=pwx918z4VvG/EX+huL5kDLR9MJ
	R9RRq3unYkUMKWWy0dy4LCBKrVY38e2YK9Jp1MR0ilXSEoOwaKt9IJbftP1ELgeQXZRMORjLaTXOP
	dGEc0jqpu4zryA7VRDGSNs3H6NMVdcLYcF57MaSlYzpHRg9GTq7vpMYBVv9ngM5M4saPbNhg4o+Z4
	3qosb6FXk8lZRzyjueozXH2zl55oJSKyYrVC4+V0vaa2YM1idADG+GlqVsmsImLXn4w4UUKl0L+eR
	7N0dRMbpiDCWsTu+NGqzkqJ0rf+IpXlPj6RKECbhlPw+/wEuRL5L4EouU5YbcMhD+dduTIjS2HL3g
	6tFkg5hw==;
Received: from ip6-localhost ([::1]:60042 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r1Lev-007VvK-FM; Fri, 10 Nov 2023 07:10:30 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:56440) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r1LeW-007VvB-In
 for samba-technical@lists.samba.org; Fri, 10 Nov 2023 07:10:08 +0000
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c5071165d5so22851311fa.0
 for <samba-technical@lists.samba.org>; Thu, 09 Nov 2023 23:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699600202; x=1700205002; darn=lists.samba.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YJP5qTRtuZcVZvUNSgHKo7QSwb9ciHUra42VIGSwBpg=;
 b=BRdkyTUvHNVqWlZSgkG9GLhO+zizaTBSa2RENlPB50w6hlN7vM/KGe3NWrDwM8/L0L
 Eq/zMqJC1rLuZ0GJDHU7Po8Z1EDgOB6cotJQFZl9vpNPu35gnkfbSx8h4l1vRprVAEMk
 SfhBc2dReEfGS9sMxl7M1cdyDyH2SPcXbNeuaoZakVnEB4Xet2/fN3pp+U+V0Kvr0djy
 +qtpT+X2d16xPZvd9fi3YHkzEqbYMjSuMHMHG6kiTgq5P7qUp5q/MR1fUjn7qr92oKdH
 9O2+pcnaHYpBSlEvJnHZiWgJAqoc65Qpomh9gVNEMaMrEiZMaEL5IdFnEtDgxTfd3nXL
 WV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699600202; x=1700205002;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YJP5qTRtuZcVZvUNSgHKo7QSwb9ciHUra42VIGSwBpg=;
 b=WXDhJqaeQh8ZrxWr3l6X1++77o7ax8ovTquwLu6tdIzOOeAAZnX1a1ALmkRR1O3WHf
 34isEcHjtyRHiPMtnV1aMJe49+ir4u0ruPi3qsTdAPi7miu7qBABFYnPIMudprPbVCre
 pp4zIr7J3FZgZRFtnP4j85qoUcowZAHKfYQqFUopzZlz20gRA+4jFTQzRwNPUZjqDGIH
 tgkihk+vz3f5+9KojcCcqfvEVEI4Wt6y1wJsiGw/wYJ9KWdsZvyGfW5RRCVLC7GiK6Ph
 aP1fep7ulHwL01D2VazDjyaKLwCB6F4tSwnaFCGioeb2WsyT+j8sT0tI32RGb5tXJUKF
 x+2Q==
X-Gm-Message-State: AOJu0YzVeqcLiLyR7fAM4U6wjA/mGMaYr3Z+jUiwU7xZLH3f42d8heO2
 OIwjVk+aA2AupqhZMTVHxoQ8HZ3UsdmN0KjCfqM=
X-Google-Smtp-Source: AGHT+IHm4Jxh0L2SD39HlEEFtLhcp35pC028LV4wfCSsv7srAhe6FIz7fmE9ivtkNstAR/Xq5r3rw9i57aYnBsNh7QU=
X-Received: by 2002:ac2:44d8:0:b0:509:44cd:241c with SMTP id
 d24-20020ac244d8000000b0050944cd241cmr3101543lfm.32.1699600202119; Thu, 09
 Nov 2023 23:10:02 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mt-t0QDZk4Zz+cSs8=s=VhUW09erUBAtm8f7xXG3rHJqw@mail.gmail.com>
 <CAH2r5mtWC4hX8v-CwDQC6qp4tWzdNaMSag9myYM4dGmC4zr9FA@mail.gmail.com>
In-Reply-To: <CAH2r5mtWC4hX8v-CwDQC6qp4tWzdNaMSag9myYM4dGmC4zr9FA@mail.gmail.com>
Date: Fri, 10 Nov 2023 01:09:50 -0600
Message-ID: <CAH2r5mugOefduw_pgpYCZtHPiuosSQrcOKb0MFcv8v7giEopMA@mail.gmail.com>
Subject: Re: [PATCH][smb3 client] allow debugging session and tcon info to
 improve stats analysis and debugging
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000004f3f560609c702e8"
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

--0000000000004f3f560609c702e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixed one minor bug (missing cifs_put_tlink call to free reference on
tlink) and updated cifs-2.6.git for-next

See attached (updated patch)


On Thu, Nov 9, 2023 at 8:51=E2=80=AFPM Steve French <smfrench@gmail.com> wr=
ote:
>
> Updated patch to remove dumping of flags (tcon->Flags was already
> supposed to be dumped via
> the other ioctl (CIFS_IOC_GET_MNT_INFO) but it had a minor bug - will
> send followon patch for that)
>
>
> On Thu, Nov 9, 2023 at 3:51=E2=80=AFPM Steve French <smfrench@gmail.com> =
wrote:
> >
> > [PATCH] smb3: allow debugging session and tcon info to improve stats
> >  analysis and debugging
> >
> > When multiple mounts are to the same share from the same client it was =
not
> > possible to determine which section of /proc/fs/cifs/Stats (and DebugDa=
ta)
> > correspond to that mount.  In some recent examples this turned out to  =
be
> > a significant problem when trying to analyze performance problems - sin=
ce
> > there are many cases where unless we know the tree id and session id we
> > can't figure out which stats (e.g. number of SMB3.1.1 requests by type,
> > the total time they take, which is slowest, how many fail etc.) apply t=
o
> > which mount.
> >
> > Add an ioctl to return tid, session id, tree connect count and tcon fla=
gs.
> >
> > --
> > Thanks,
> >
> > Steve
>
>
>
> --
> Thanks,
>
> Steve



--
Thanks,

Steve

--0000000000004f3f560609c702e8
Content-Type: application/x-patch; 
	name="0001-smb3-allow-dumping-session-and-tcon-id-to-improve-st.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-allow-dumping-session-and-tcon-id-to-improve-st.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_losa10tl0>
X-Attachment-Id: f_losa10tl0

RnJvbSBlNTE5YmQxOTdhN2UyZjU4ZTA4MGYxNjk0OTk3NTdkYTg4MTIyNGI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFRodSwgOSBOb3YgMjAyMyAxNToyODoxMiAtMDYwMApTdWJqZWN0OiBbUEFUQ0hdIHNt
YjM6IGFsbG93IGR1bXBpbmcgc2Vzc2lvbiBhbmQgdGNvbiBpZCB0byBpbXByb3ZlIHN0YXRzCiBh
bmFseXNpcyBhbmQgZGVidWdnaW5nCgpXaGVuIG11bHRpcGxlIG1vdW50cyBhcmUgdG8gdGhlIHNh
bWUgc2hhcmUgZnJvbSB0aGUgc2FtZSBjbGllbnQgaXQgd2FzIG5vdApwb3NzaWJsZSB0byBkZXRl
cm1pbmUgd2hpY2ggc2VjdGlvbiBvZiAvcHJvYy9mcy9jaWZzL1N0YXRzIChhbmQgRGVidWdEYXRh
KQpjb3JyZXNwb25kIHRvIHRoYXQgbW91bnQuICBJbiBzb21lIHJlY2VudCBleGFtcGxlcyB0aGlz
IHR1cm5lZCBvdXQgdG8gIGJlCmEgc2lnbmlmaWNhbnQgcHJvYmxlbSB3aGVuIHRyeWluZyB0byBh
bmFseXplIHBlcmZvcm1hbmNlIGRhdGEgLSBzaW5jZQp0aGVyZSBhcmUgbWFueSBjYXNlcyB3aGVy
ZSB1bmxlc3Mgd2Uga25vdyB0aGUgdHJlZSBpZCBhbmQgc2Vzc2lvbiBpZCB3ZQpjYW4ndCBmaWd1
cmUgb3V0IHdoaWNoIHN0YXRzIChlLmcuIG51bWJlciBvZiBTTUIzLjEuMSByZXF1ZXN0cyBieSB0
eXBlLAp0aGUgdG90YWwgdGltZSB0aGV5IHRha2UsIHdoaWNoIGlzIHNsb3dlc3QsIGhvdyBtYW55
IGZhaWwgZXRjLikgYXBwbHkgdG8Kd2hpY2ggbW91bnQuIFRoZSBvbmx5IGV4aXN0aW5nIGxvb3Nl
bHkgcmVsYXRlZCBpb2N0bCBDSUZTX0lPQ19HRVRfTU5UX0lORk8KZG9lcyBub3QgcmV0dXJuIHRo
ZSBpbmZvcm1hdGlvbiBuZWVkZWQgdG8gdW5pcXVlbHkgaWRlbnRpZnkgd2hpY2ggdGNvbgppcyB3
aGljaCBtb3VudCBhbHRob3VnaCBpdCBkb2VzIHJldHVybiB2YXJpb3VzIGZsYWdzIGFuZCBkZXZp
Y2UgaW5mby4KCkFkZCBhIGNpZnMua28gaW9jdGwgQ0lGU19JT0NfR0VUX1RDT05fSU5GTyAoMHg4
MDBjY2YwYykgdG8gcmV0dXJuIHRpZCwKc2Vzc2lvbiBpZCwgdHJlZSBjb25uZWN0IGNvdW50LgoK
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxz
dGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL3NtYi9jbGllbnQvY2lmc19pb2N0bC5oIHwg
IDYgKysrKysrCiBmcy9zbWIvY2xpZW50L2lvY3RsLmMgICAgICB8IDI1ICsrKysrKysrKysrKysr
KysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2ZzL3NtYi9jbGllbnQvY2lmc19pb2N0bC5oIGIvZnMvc21iL2NsaWVudC9jaWZzX2lvY3Rs
LmgKaW5kZXggMzMyNTg4ZTc3YzMxLi4yNjMyNzQ0MmUzODMgMTAwNjQ0Ci0tLSBhL2ZzL3NtYi9j
bGllbnQvY2lmc19pb2N0bC5oCisrKyBiL2ZzL3NtYi9jbGllbnQvY2lmc19pb2N0bC5oCkBAIC0y
Niw2ICsyNiwxMSBAQCBzdHJ1Y3Qgc21iX21udF9mc19pbmZvIHsKIAlfX3U2NCAgIGNpZnNfcG9z
aXhfY2FwczsKIH0gX19wYWNrZWQ7CiAKK3N0cnVjdCBzbWJfbW50X3Rjb25faW5mbyB7CisJX191
MzIJdGlkOworCV9fdTY0CXNlc3Npb25faWQ7Cit9IF9fcGFja2VkOworCiBzdHJ1Y3Qgc21iX3Nu
YXBzaG90X2FycmF5IHsKIAlfX3UzMgludW1iZXJfb2Zfc25hcHNob3RzOwogCV9fdTMyCW51bWJl
cl9vZl9zbmFwc2hvdHNfcmV0dXJuZWQ7CkBAIC0xMDgsNiArMTEzLDcgQEAgc3RydWN0IHNtYjNf
bm90aWZ5X2luZm8gewogI2RlZmluZSBDSUZTX0lPQ19OT1RJRlkgX0lPVyhDSUZTX0lPQ1RMX01B
R0lDLCA5LCBzdHJ1Y3Qgc21iM19ub3RpZnkpCiAjZGVmaW5lIENJRlNfRFVNUF9GVUxMX0tFWSBf
SU9XUihDSUZTX0lPQ1RMX01BR0lDLCAxMCwgc3RydWN0IHNtYjNfZnVsbF9rZXlfZGVidWdfaW5m
bykKICNkZWZpbmUgQ0lGU19JT0NfTk9USUZZX0lORk8gX0lPV1IoQ0lGU19JT0NUTF9NQUdJQywg
MTEsIHN0cnVjdCBzbWIzX25vdGlmeV9pbmZvKQorI2RlZmluZSBDSUZTX0lPQ19HRVRfVENPTl9J
TkZPIF9JT1IoQ0lGU19JT0NUTF9NQUdJQywgMTIsIHN0cnVjdCBzbWJfbW50X3Rjb25faW5mbykK
ICNkZWZpbmUgQ0lGU19JT0NfU0hVVERPV04gX0lPUignWCcsIDEyNSwgX191MzIpCiAKIC8qCmRp
ZmYgLS1naXQgYS9mcy9zbWIvY2xpZW50L2lvY3RsLmMgYi9mcy9zbWIvY2xpZW50L2lvY3RsLmMK
aW5kZXggZjcxNjAwMDNlMGVkLi43M2VkZWRhOGViYTUgMTAwNjQ0Ci0tLSBhL2ZzL3NtYi9jbGll
bnQvaW9jdGwuYworKysgYi9mcy9zbWIvY2xpZW50L2lvY3RsLmMKQEAgLTExNyw2ICsxMTcsMjAg
QEAgc3RhdGljIGxvbmcgY2lmc19pb2N0bF9jb3B5Y2h1bmsodW5zaWduZWQgaW50IHhpZCwgc3Ry
dWN0IGZpbGUgKmRzdF9maWxlLAogCXJldHVybiByYzsKIH0KIAorc3RhdGljIGxvbmcgc21iX21u
dF9nZXRfdGNvbl9pbmZvKHN0cnVjdCBjaWZzX3Rjb24gKnRjb24sIHZvaWQgX191c2VyICphcmcp
Cit7CisJaW50IHJjID0gMDsKKwlzdHJ1Y3Qgc21iX21udF90Y29uX2luZm8gdGNvbl9pbmY7CisK
Kwl0Y29uX2luZi50aWQgPSB0Y29uLT50aWQ7CisJdGNvbl9pbmYuc2Vzc2lvbl9pZCA9IHRjb24t
PnNlcy0+U3VpZDsKKworCWlmIChjb3B5X3RvX3VzZXIoYXJnLCAmdGNvbl9pbmYsIHNpemVvZihz
dHJ1Y3Qgc21iX21udF90Y29uX2luZm8pKSkKKwkJcmMgPSAtRUZBVUxUOworCisJcmV0dXJuIHJj
OworfQorCiBzdGF0aWMgbG9uZyBzbWJfbW50X2dldF9mc2luZm8odW5zaWduZWQgaW50IHhpZCwg
c3RydWN0IGNpZnNfdGNvbiAqdGNvbiwKIAkJCQl2b2lkIF9fdXNlciAqYXJnKQogewpAQCAtNDE0
LDYgKzQyOCwxNyBAQCBsb25nIGNpZnNfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGVwLCB1bnNpZ25l
ZCBpbnQgY29tbWFuZCwgdW5zaWduZWQgbG9uZyBhcmcpCiAJCQl0Y29uID0gdGxpbmtfdGNvbihw
U01CRmlsZS0+dGxpbmspOwogCQkJcmMgPSBzbWJfbW50X2dldF9mc2luZm8oeGlkLCB0Y29uLCAo
dm9pZCBfX3VzZXIgKilhcmcpOwogCQkJYnJlYWs7CisJCWNhc2UgQ0lGU19JT0NfR0VUX1RDT05f
SU5GTzoKKwkJCWNpZnNfc2IgPSBDSUZTX1NCKGlub2RlLT5pX3NiKTsKKwkJCXRsaW5rID0gY2lm
c19zYl90bGluayhjaWZzX3NiKTsKKwkJCWlmIChJU19FUlIodGxpbmspKSB7CisJCQkJcmMgPSBQ
VFJfRVJSKHRsaW5rKTsKKwkJCQlicmVhazsKKwkJCX0KKwkJCXRjb24gPSB0bGlua190Y29uKHRs
aW5rKTsKKwkJCXJjID0gc21iX21udF9nZXRfdGNvbl9pbmZvKHRjb24sICh2b2lkIF9fdXNlciAq
KWFyZyk7CisJCQljaWZzX3B1dF90bGluayh0bGluayk7CisJCQlicmVhazsKIAkJY2FzZSBDSUZT
X0VOVU1FUkFURV9TTkFQU0hPVFM6CiAJCQlpZiAocFNNQkZpbGUgPT0gTlVMTCkKIAkJCQlicmVh
azsKLS0gCjIuMzkuMgoK
--0000000000004f3f560609c702e8--

