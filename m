Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E99377E77C5
	for <lists+samba-technical@lfdr.de>; Fri, 10 Nov 2023 03:52:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=dAXDZ69nrkS7N72/j7SW0+gUbbI3vxGmGI9lNSuWXMo=; b=Z19DrxllsqdvlJov5x4gFwGMin
	nJ80WdQQ43tGqcKihUY9P+vYUZqTXhnhIVp+DjAADN/vyoSKLSPTxi+uld1j20724Fn+SeNHotmOv
	iLhTQZNbzrlzvdWd8/En3HciGAL4pveLV5tFZR1v65/OoQVqSqg30FHCq9ry5QvfpPI5bZVzEumOW
	XecOKgTIrniK7bzrn6YsSTDHcBLTur2LdctEYsEGOaV2Na5H396y+g7inNd5LvunHt63OGfge364n
	TiVsoH7fsSNmJUV3P4mPgHzlQdH6/kxQtKAa+JDJiK3QBTkJYs1KZrF42wr94sBc3S4xmR+Afvmip
	R4IWQWlQ==;
Received: from ip6-localhost ([::1]:26804 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r1HcR-007T9F-Tz; Fri, 10 Nov 2023 02:51:40 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:53586) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r1HcM-007T96-Qd
 for samba-technical@lists.samba.org; Fri, 10 Nov 2023 02:51:38 +0000
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5094727fa67so2161138e87.3
 for <samba-technical@lists.samba.org>; Thu, 09 Nov 2023 18:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699584693; x=1700189493; darn=lists.samba.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dAXDZ69nrkS7N72/j7SW0+gUbbI3vxGmGI9lNSuWXMo=;
 b=gBeoGjTDrlM46Pb/jeteqKCjILm5m3LBX5B3shfg6Rc577z3yGIFMYgT8ocrXF4kzQ
 UbDxVIWTZp6IVrei6tL+G5hcL+2r45SldkYyvRnf+xP50H2WM2HaAKco66WSEC1CUVyS
 r3J6R/6/XAugSk8t1+QjIznDRgRBzGPK0LXSPcrFZvDppzZT7u8hlpCsP3TVl+pn/VCu
 eZRlt9yV1bHdGgQxN3DkEOG2XeD1K3iSWzHLYcOF11yt8tH9YYNS6//JsQDLvzfu4yG2
 kpdeJT2GbF9JTGTbVKUi5lZzGhJc+MYBWhnk8MuF82V1cIFId6HU/au+SB5Xp/Xj4pF5
 T8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699584693; x=1700189493;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dAXDZ69nrkS7N72/j7SW0+gUbbI3vxGmGI9lNSuWXMo=;
 b=BDJaVal3UpLhy9gj9DstPHrhgnbLUs/J6OjD/Hl9NAI5CIPosQewH3P+il7x67dsS4
 2+62BuioIYfc2j3VfYmlzo4+GHiZJRJrLGXclX89JuRCh3UAhCiUxbo5AT5vG/KQ9NWy
 Ou2pZGo3AxevuJgYa2fe5ZQnluimyasYCH2w7bLNVkCLPUqq/MVSE8u4/5d7xV3hb0Vl
 CbJg6aioidHfBIsLchtfowMJwG8tf1PsFzDvxQ4jqWPbnF+nibZZesDx9GgH5A7B7X8C
 BZyGZWKDrGGF8R4PXgURrTFV/XqrXmD+V8elKw2u2MwgM8Nz8o8urZ3s06Zo/UtETs5a
 83rQ==
X-Gm-Message-State: AOJu0YweEKJOvGOWa/T+wHVUdoqKjKIx5zruYV2XIJzLWuWtLwF87sI0
 II8nXl7krfUdxP+/WhFbEe1/SH3mmfHaHsM7eLQGyxWh8q3Rw+qBIDA=
X-Google-Smtp-Source: AGHT+IFeUjP5/BnL8U6v/U2DBrmLCwDO04iWQmT5XaHgVC+/39xOTrJmqVMBgpSqsVlMFLaHLAfzgjhDnzOolmxA75A=
X-Received: by 2002:a05:6512:b8e:b0:507:aaa9:b07f with SMTP id
 b14-20020a0565120b8e00b00507aaa9b07fmr3510240lfv.3.1699584692448; Thu, 09 Nov
 2023 18:51:32 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mt-t0QDZk4Zz+cSs8=s=VhUW09erUBAtm8f7xXG3rHJqw@mail.gmail.com>
In-Reply-To: <CAH2r5mt-t0QDZk4Zz+cSs8=s=VhUW09erUBAtm8f7xXG3rHJqw@mail.gmail.com>
Date: Thu, 9 Nov 2023 20:51:19 -0600
Message-ID: <CAH2r5mtWC4hX8v-CwDQC6qp4tWzdNaMSag9myYM4dGmC4zr9FA@mail.gmail.com>
Subject: Re: [PATCH][smb3 client] allow debugging session and tcon info to
 improve stats analysis and debugging
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="000000000000dc11960609c365c8"
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

--000000000000dc11960609c365c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Updated patch to remove dumping of flags (tcon->Flags was already
supposed to be dumped via
the other ioctl (CIFS_IOC_GET_MNT_INFO) but it had a minor bug - will
send followon patch for that)


On Thu, Nov 9, 2023 at 3:51=E2=80=AFPM Steve French <smfrench@gmail.com> wr=
ote:
>
> [PATCH] smb3: allow debugging session and tcon info to improve stats
>  analysis and debugging
>
> When multiple mounts are to the same share from the same client it was no=
t
> possible to determine which section of /proc/fs/cifs/Stats (and DebugData=
)
> correspond to that mount.  In some recent examples this turned out to  be
> a significant problem when trying to analyze performance problems - since
> there are many cases where unless we know the tree id and session id we
> can't figure out which stats (e.g. number of SMB3.1.1 requests by type,
> the total time they take, which is slowest, how many fail etc.) apply to
> which mount.
>
> Add an ioctl to return tid, session id, tree connect count and tcon flags=
.
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

--000000000000dc11960609c365c8
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-allow-dumping-session-and-tcon-id-to-improve-st.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-allow-dumping-session-and-tcon-id-to-improve-st.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_los0u0vt0>
X-Attachment-Id: f_los0u0vt0

RnJvbSAwMDNmZmEzMjZkZjQ4MTQ4NmRlNjFkNzYxODU1MTI2ZDk2ODE4NGFjIE1vbiBTZXAgMTcg
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
MDEwY2YwYykgdG8gcmV0dXJuIHRpZCwKc2Vzc2lvbiBpZCwgdHJlZSBjb25uZWN0IGNvdW50LgoK
U2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQuY29tPgoKZm9v
Ci0tLQogZnMvc21iL2NsaWVudC9jaWZzX2lvY3RsLmggfCAgNyArKysrKysrCiBmcy9zbWIvY2xp
ZW50L2lvY3RsLmMgICAgICB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMg
Y2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvY2lm
c19pb2N0bC5oIGIvZnMvc21iL2NsaWVudC9jaWZzX2lvY3RsLmgKaW5kZXggMzMyNTg4ZTc3YzMx
Li43MWJkY2U3ZWE2MGMgMTAwNjQ0Ci0tLSBhL2ZzL3NtYi9jbGllbnQvY2lmc19pb2N0bC5oCisr
KyBiL2ZzL3NtYi9jbGllbnQvY2lmc19pb2N0bC5oCkBAIC0yNiw2ICsyNiwxMiBAQCBzdHJ1Y3Qg
c21iX21udF9mc19pbmZvIHsKIAlfX3U2NCAgIGNpZnNfcG9zaXhfY2FwczsKIH0gX19wYWNrZWQ7
CiAKK3N0cnVjdCBzbWJfbW50X3Rjb25faW5mbyB7CisJX191MzIJdGlkOworCV9fdTY0CXNlc3Np
b25faWQ7CisJaW50CXRjX2NvdW50OworfSBfX3BhY2tlZDsKKwogc3RydWN0IHNtYl9zbmFwc2hv
dF9hcnJheSB7CiAJX191MzIJbnVtYmVyX29mX3NuYXBzaG90czsKIAlfX3UzMgludW1iZXJfb2Zf
c25hcHNob3RzX3JldHVybmVkOwpAQCAtMTA4LDYgKzExNCw3IEBAIHN0cnVjdCBzbWIzX25vdGlm
eV9pbmZvIHsKICNkZWZpbmUgQ0lGU19JT0NfTk9USUZZIF9JT1coQ0lGU19JT0NUTF9NQUdJQywg
OSwgc3RydWN0IHNtYjNfbm90aWZ5KQogI2RlZmluZSBDSUZTX0RVTVBfRlVMTF9LRVkgX0lPV1Io
Q0lGU19JT0NUTF9NQUdJQywgMTAsIHN0cnVjdCBzbWIzX2Z1bGxfa2V5X2RlYnVnX2luZm8pCiAj
ZGVmaW5lIENJRlNfSU9DX05PVElGWV9JTkZPIF9JT1dSKENJRlNfSU9DVExfTUFHSUMsIDExLCBz
dHJ1Y3Qgc21iM19ub3RpZnlfaW5mbykKKyNkZWZpbmUgQ0lGU19JT0NfR0VUX1RDT05fSU5GTyBf
SU9SKENJRlNfSU9DVExfTUFHSUMsIDEyLCBzdHJ1Y3Qgc21iX21udF90Y29uX2luZm8pCiAjZGVm
aW5lIENJRlNfSU9DX1NIVVRET1dOIF9JT1IoJ1gnLCAxMjUsIF9fdTMyKQogCiAvKgpkaWZmIC0t
Z2l0IGEvZnMvc21iL2NsaWVudC9pb2N0bC5jIGIvZnMvc21iL2NsaWVudC9pb2N0bC5jCmluZGV4
IGY3MTYwMDAzZTBlZC4uZjEzNzMwNzUwZTg0IDEwMDY0NAotLS0gYS9mcy9zbWIvY2xpZW50L2lv
Y3RsLmMKKysrIGIvZnMvc21iL2NsaWVudC9pb2N0bC5jCkBAIC0xMTcsNiArMTE3LDIxIEBAIHN0
YXRpYyBsb25nIGNpZnNfaW9jdGxfY29weWNodW5rKHVuc2lnbmVkIGludCB4aWQsIHN0cnVjdCBm
aWxlICpkc3RfZmlsZSwKIAlyZXR1cm4gcmM7CiB9CiAKK3N0YXRpYyBsb25nIHNtYl9tbnRfZ2V0
X3Rjb25faW5mbyhzdHJ1Y3QgY2lmc190Y29uICp0Y29uLCB2b2lkIF9fdXNlciAqYXJnKQorewor
CWludCByYyA9IDA7CisJc3RydWN0IHNtYl9tbnRfdGNvbl9pbmZvIHRjb25faW5mOworCisJdGNv
bl9pbmYudGlkID0gdGNvbi0+dGlkOworCXRjb25faW5mLnNlc3Npb25faWQgPSB0Y29uLT5zZXMt
PlN1aWQ7CisJdGNvbl9pbmYudGNfY291bnQgPSB0Y29uLT50Y19jb3VudDsKKworCWlmIChjb3B5
X3RvX3VzZXIoYXJnLCAmdGNvbl9pbmYsIHNpemVvZihzdHJ1Y3Qgc21iX21udF90Y29uX2luZm8p
KSkKKwkJcmMgPSAtRUZBVUxUOworCisJcmV0dXJuIHJjOworfQorCiBzdGF0aWMgbG9uZyBzbWJf
bW50X2dldF9mc2luZm8odW5zaWduZWQgaW50IHhpZCwgc3RydWN0IGNpZnNfdGNvbiAqdGNvbiwK
IAkJCQl2b2lkIF9fdXNlciAqYXJnKQogewpAQCAtNDE0LDYgKzQyOSwxNiBAQCBsb25nIGNpZnNf
aW9jdGwoc3RydWN0IGZpbGUgKmZpbGVwLCB1bnNpZ25lZCBpbnQgY29tbWFuZCwgdW5zaWduZWQg
bG9uZyBhcmcpCiAJCQl0Y29uID0gdGxpbmtfdGNvbihwU01CRmlsZS0+dGxpbmspOwogCQkJcmMg
PSBzbWJfbW50X2dldF9mc2luZm8oeGlkLCB0Y29uLCAodm9pZCBfX3VzZXIgKilhcmcpOwogCQkJ
YnJlYWs7CisJCWNhc2UgQ0lGU19JT0NfR0VUX1RDT05fSU5GTzoKKwkJCWNpZnNfc2IgPSBDSUZT
X1NCKGlub2RlLT5pX3NiKTsKKwkJCXRsaW5rID0gY2lmc19zYl90bGluayhjaWZzX3NiKTsKKwkJ
CWlmIChJU19FUlIodGxpbmspKSB7CisJCQkJcmMgPSBQVFJfRVJSKHRsaW5rKTsKKwkJCQlicmVh
azsKKwkJCX0KKwkJCXRjb24gPSB0bGlua190Y29uKHRsaW5rKTsKKwkJCXJjID0gc21iX21udF9n
ZXRfdGNvbl9pbmZvKHRjb24sICh2b2lkIF9fdXNlciAqKWFyZyk7CisJCQlicmVhazsKIAkJY2Fz
ZSBDSUZTX0VOVU1FUkFURV9TTkFQU0hPVFM6CiAJCQlpZiAocFNNQkZpbGUgPT0gTlVMTCkKIAkJ
CQlicmVhazsKLS0gCjIuMzkuMgoK
--000000000000dc11960609c365c8--

