Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9A8B3C4E0
	for <lists+samba-technical@lfdr.de>; Sat, 30 Aug 2025 00:32:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=D5LILI3BrETC9EOLPWKkYIiAly3h6+hVppm2fXa/NIo=; b=vKcJ98HKqLR/GYYelsOz008rtE
	atngBsURV5F7jZv0GwrBIr66D9CwPIbXt6fElKVfSwZlnE01lhr2FPeiAYM/fIhfkXpwrSaPZA09q
	VMHXJ7QDSQMiLIhj0uxgy8nrGdrN5UCDBe6KcUTZ0clvyg+oQXCCY1HMEqMUQWytwBuKD4Si1pcaL
	nkPU4I9uL38ExcV8bH3DEMPAdHdCc5oRTpbAOOVsiH5Sdl51HCvlfkYX3y5YTwNQLN1Yt23+MUylI
	j4V4u5wim/pMdfMF2XFbBYZMo4ZGK07FEFwWy8bcYgi1TmvJEXAqm7bNjgMgkcEWfAMMa9KZDd7FW
	V6f5NyYw==;
Received: from ip6-localhost ([::1]:31704 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1us7dW-000oIj-Dv; Fri, 29 Aug 2025 22:31:58 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:58463) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1us7dR-000oIZ-Jb
 for samba-technical@lists.samba.org; Fri, 29 Aug 2025 22:31:56 +0000
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-70fa0e37bc5so5678026d6.0
 for <samba-technical@lists.samba.org>; Fri, 29 Aug 2025 15:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756506711; x=1757111511; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D5LILI3BrETC9EOLPWKkYIiAly3h6+hVppm2fXa/NIo=;
 b=dK9s97YQDNDarePkEeg09pmSuwxNaBWem8Rm/QGr6hvgfPejOHFpAa5i4BAGc+kkY0
 1oaGY0ts2Z7cXqBsXpZDvwCLw8q+c8HzJc5fd2gy0S812c8RrN2nf/XDrPCN/++kviRw
 bUN37qs3rvvE5VqWyOyoY9junm22fzp3OB6vsKWh54bsvRDAyhIpBsilz/3msGhiVCzp
 DEs3p8rCIrlgVKTNeAdTFp/3+aFzaMKvFTqEODN6L1+ePFHS1nr7Gcw1GbdvASUZXInW
 T5vrBXjpZl4OOq1oJd760E79yvu8ViKY9Kbr47T+MAKb2w36AvWac+5hO1SSOpsttcP3
 F2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756506711; x=1757111511;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D5LILI3BrETC9EOLPWKkYIiAly3h6+hVppm2fXa/NIo=;
 b=qFoobL/Pto7Hk7bjOK7gHXIneo5bFy0lgkzl4bNTAKs/yRfjL2dP0AziTv3H4/YKAx
 F2x1ZQdW3Vv8yQ++qZWsqxjSx1mLr5Wd8wm1DSZ24BrjSmujgNbIx8uvSE5oMl8vTLV9
 ePIx1lLrByHqGmletqJb8/pabdgCGDSo8MnecR0MQyasP0upc7iLByYy+s26LSGbbwti
 kkQrL/RgK3oSMN9JB8uK9mMzUQgT8MwS8imMVTY6d8ZV8q8Fk40ltaLqID2HUG8W537Q
 fr+PtmcKfikfwsmZLBuOqzLDuNRBLnGMSEQdlLgay+w6uBCoszsmCYnQglMcc8kkjbui
 dgSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo0mA1oS1iHSdewkB+UUX05B4dZ2oaUZBVD9pCprKw7UYxckOlzc5AqCc+JCuvm9jnt/RXrDGj30F/OiOU2BA=@lists.samba.org
X-Gm-Message-State: AOJu0Yx81ucEw0zsejvgRJm0Pw1tsumjbvQNevJUrTlTwlufbEnqPUDd
 Z6Tp4F7YT+F0Gu0SYExchQcw47dCwFvif394sBWcsLtC74mttdrHbUT/CYpKopB/8MImqM4/Yib
 upqtNGwCSnoSk+9GWzqSJ+fMtCbP0G9w=
X-Gm-Gg: ASbGncvTveUPQssWKZyILi/bEUadbBmYFhdqhNLNpoPVDZvLPvmVFWI1QAbl4+K8Ppp
 eMRxStpUjXuVxoJBiZ7bkNjLEVaILUphd8QrM0oNB2vaOlD0ojcw25jxUScWXSXFxWAbBytLgvh
 zTXZ5oIBcfTbGzW9267O5GreeHd6JHyX0d5X5BHBj339H8YJdt0kGqpGFonJDmZjoa1aMCu+imR
 oWvACpPDH9sX6JuFSfwg0xrqorS+tWsc3s5ufbzY5m0n01/OWBCRfc1oUM4q0bYIWtE29neWCnP
 wn3hxy8xsjlFpL0tV+Obfg==
X-Google-Smtp-Source: AGHT+IFDfPhHbTtYrim7gXYOnXvle+8uZtP9WNKRHl5jXOS1PDOuqPXEBxSOVFv40M3RJiRulBGma80bQyB+ZLGOBKs=
X-Received: by 2002:a05:6214:f08:b0:70d:dbf3:a377 with SMTP id
 6a1803df08f44-70fac7868c2mr2891016d6.24.1756506711347; Fri, 29 Aug 2025
 15:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <202508291432.M5gWPqJX-lkp@intel.com>
 <c18ba6b4-847e-4470-bd0e-9e5232add730@samba.org>
 <CAH2r5mvksbiH-D4FbVb0PVg1vnik+WU7d0kxRUk0S9h9S+=zvw@mail.gmail.com>
 <2854f742-a0bc-4456-a372-9fa2d4e2ee3f@samba.org>
In-Reply-To: <2854f742-a0bc-4456-a372-9fa2d4e2ee3f@samba.org>
Date: Fri, 29 Aug 2025 17:31:39 -0500
X-Gm-Features: Ac12FXxmXORTkXDusjVFRlJFrVpRS2gNUmp2AJ53_1tM1bxR6Wu59aPYuOkdcAs
Message-ID: <CAH2r5muGufmSdjxqTv9wcpbZoMsoEq=1ufFo_Yty352uDf+3-w@mail.gmail.com>
Subject: Re: [cifs:for-next-next 28/146] fs/smb/client/smbdirect.c:1856:25:
 warning: stack frame size (1272) exceeds limit (1024) in 'smbd_get_connection'
To: Stefan Metzmacher <metze@samba.org>
Content-Type: multipart/mixed; boundary="000000000000937270063d8896d6"
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>, linux-cifs@vger.kernel.org,
 kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 samba-technical@lists.samba.org, oe-kbuild-all@lists.linux.dev,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000937270063d8896d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

updated " smb: smbdirect: introduce smbdirect_socket_init()" patch attached

Also updated cifs-2.6.git for-next-next

Let me know if any additional problems or other patches to update

On Fri, Aug 29, 2025 at 1:03=E2=80=AFPM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Am 29.08.25 um 19:59 schrieb Steve French:
> > I have updated the patch (see attached), and updated cifs-2.6.git for-n=
ext-next
> >
> >> I'm not sure if the following should be added
> >> Reported-by: kernel test robot <lkp@intel.com>
> >
> > That is a good question, but I lean against it since the "initial bug"
> > was not reported by them that caused the patch.  If it was a distinct
> > patch fixing the bug they pointed out, then yes it should be added,
> > but could be confusing if what they pointed out was totally unrelated
> > to the purpose of the patch.
>
> You squashed it into the wrong commit. Please patch this one:
> f2e2769275f4aa6e4d5fa98004301e91282a094a smb: smbdirect: introduce smbdir=
ect_socket_init()
>
> Thanks!
> metze



--=20
Thanks,

Steve

--000000000000937270063d8896d6
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb-smbdirect-introduce-smbdirect_socket_init.patch"
Content-Disposition: attachment; 
	filename="0001-smb-smbdirect-introduce-smbdirect_socket_init.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mexept750>
X-Attachment-Id: f_mexept750

RnJvbSA2ZWQ4MDhkNjE4NzgzNzYxZGZiOTc2ODFmZDBhMGZkNWQzM2I3YzhmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGVmYW4gTWV0em1hY2hlciA8bWV0emVAc2FtYmEub3JnPgpE
YXRlOiBGcmksIDggQXVnIDIwMjUgMTU6MDg6MzMgKzAyMDAKU3ViamVjdDogW1BBVENIXSBzbWI6
IHNtYmRpcmVjdDogaW50cm9kdWNlIHNtYmRpcmVjdF9zb2NrZXRfaW5pdCgpCgpUaGlzIHdpbGwg
bWFrZSBpdCBlYXNpZXIgdG8ga2VlcCB0aGUgaW5pdGlhbGl6YXRpb24KaW4gYSBzaW5nbGUgcGxh
Y2UuCgpGb3Igbm93IGl0J3MgYW4gX19hbHdheXNfaW5saW5lIGZ1bmN0aW9uIGFzIHdlIG9ubHkK
c2hhcmUgdGhlIGhlYWRlciBmaWxlcy4gT25jZSBtb3ZlIHRvIGNvbW1vbiBmdW5jdGlvbnMKd2Un
bGwgaGF2ZSBhIGRlZGljYXRlZCBzbWJkaXJlY3Qua28gdGhhdCBleHBvcnRzIGZ1bmN0aW9ucy4u
LgoKQ2M6IFN0ZXZlIEZyZW5jaCA8c21mcmVuY2hAZ21haWwuY29tPgpDYzogVG9tIFRhbHBleSA8
dG9tQHRhbHBleS5jb20+CkNjOiBMb25nIExpIDxsb25nbGlAbWljcm9zb2Z0LmNvbT4KQ2M6IE5h
bWphZSBKZW9uIDxsaW5raW5qZW9uQGtlcm5lbC5vcmc+CkNjOiBsaW51eC1jaWZzQHZnZXIua2Vy
bmVsLm9yZwpDYzogc2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZwpTaWduZWQtb2ZmLWJ5
OiBTdGVmYW4gTWV0em1hY2hlciA8bWV0emVAc2FtYmEub3JnPgpTaWduZWQtb2ZmLWJ5OiBTdGV2
ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+Ci0tLQogZnMvc21iL2NvbW1vbi9zbWJk
aXJlY3Qvc21iZGlyZWN0X3NvY2tldC5oIHwgMTggKysrKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jb21tb24vc21i
ZGlyZWN0L3NtYmRpcmVjdF9zb2NrZXQuaCBiL2ZzL3NtYi9jb21tb24vc21iZGlyZWN0L3NtYmRp
cmVjdF9zb2NrZXQuaAppbmRleCA4MGMzYjcxMjgwNGMuLjE3OGY3NjczZGM3ZiAxMDA2NDQKLS0t
IGEvZnMvc21iL2NvbW1vbi9zbWJkaXJlY3Qvc21iZGlyZWN0X3NvY2tldC5oCisrKyBiL2ZzL3Nt
Yi9jb21tb24vc21iZGlyZWN0L3NtYmRpcmVjdF9zb2NrZXQuaApAQCAtMTEzLDYgKzExMywyNCBA
QCBzdHJ1Y3Qgc21iZGlyZWN0X3NvY2tldCB7CiAJfSByZWN2X2lvOwogfTsKIAorc3RhdGljIF9f
YWx3YXlzX2lubGluZSB2b2lkIHNtYmRpcmVjdF9zb2NrZXRfaW5pdChzdHJ1Y3Qgc21iZGlyZWN0
X3NvY2tldCAqc2MpCit7CisJLyoKKwkgKiBUaGlzIGFsc28gc2V0cyBzdGF0dXMgPSBTTUJESVJF
Q1RfU09DS0VUX0NSRUFURUQKKwkgKi8KKwlCVUlMRF9CVUdfT04oU01CRElSRUNUX1NPQ0tFVF9D
UkVBVEVEICE9IDApOworCW1lbXNldChzYywgMCwgc2l6ZW9mKCpzYykpOworCisJaW5pdF93YWl0
cXVldWVfaGVhZCgmc2MtPnN0YXR1c193YWl0KTsKKworCUlOSVRfTElTVF9IRUFEKCZzYy0+cmVj
dl9pby5mcmVlLmxpc3QpOworCXNwaW5fbG9ja19pbml0KCZzYy0+cmVjdl9pby5mcmVlLmxvY2sp
OworCisJSU5JVF9MSVNUX0hFQUQoJnNjLT5yZWN2X2lvLnJlYXNzZW1ibHkubGlzdCk7CisJc3Bp
bl9sb2NrX2luaXQoJnNjLT5yZWN2X2lvLnJlYXNzZW1ibHkubG9jayk7CisJaW5pdF93YWl0cXVl
dWVfaGVhZCgmc2MtPnJlY3ZfaW8ucmVhc3NlbWJseS53YWl0X3F1ZXVlKTsKK30KKwogc3RydWN0
IHNtYmRpcmVjdF9zZW5kX2lvIHsKIAlzdHJ1Y3Qgc21iZGlyZWN0X3NvY2tldCAqc29ja2V0Owog
CXN0cnVjdCBpYl9jcWUgY3FlOwotLSAKMi40OC4xCgo=
--000000000000937270063d8896d6--

