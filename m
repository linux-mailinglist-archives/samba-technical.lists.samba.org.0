Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A526B3C227
	for <lists+samba-technical@lfdr.de>; Fri, 29 Aug 2025 19:59:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=uzdpvd9RhN3thFvxfLj8J0a3RKDZVl45M7XvZcko3Rc=; b=Px3HZmqIfKxPsjgVkh1oufHU+P
	u/UKL/monO/YzhJOXnO77M2bXTZLepP2+rBzCc94HjhYbLxryN0jy+LKNz9Fa91ieVW1IJLP7iNJ6
	IVAVboVTy2IC1QBcSaoR8G5tZrSpad1FqSYeKICNn/E9Qbi8t7crU5ktB7//z1KXg8fN+7VilqgYB
	M5fVdBxmilsfDR/RxuyX/ao+OvQ8M8Bmkr3cwTkPEOIjwK0Vq0i/I1sct7aOH/r77ohqD2IzQIwDa
	uYz6TMgikOiCwG4ZhzQd8laMlXAZyyTKjsEfvFTEZFplugHCx9FGw3uza/a1v1AzjVPcbnHuJwDvY
	dlILOTdQ==;
Received: from ip6-localhost ([::1]:41154 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1us3Nq-000mPE-BB; Fri, 29 Aug 2025 17:59:30 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:50283) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1us3Nk-000mP7-F1
 for samba-technical@lists.samba.org; Fri, 29 Aug 2025 17:59:27 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-70fa294211dso6757006d6.0
 for <samba-technical@lists.samba.org>; Fri, 29 Aug 2025 10:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756490362; x=1757095162; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uzdpvd9RhN3thFvxfLj8J0a3RKDZVl45M7XvZcko3Rc=;
 b=Y1eccCk1CFrefOcWQ8+kHUtRNCL61jspasY6PofsaKdtXERMS3D/gpI0rx5ehvFA2q
 sZMS2HNA7Scee6k74E2mAO1Cyk1R0Z9E1TGhWqfzs6ZPUBLbV8+cH8r437Fk52IWFydo
 mf4lr0/P+3MteOTD8WpAK+zP8fhMwo1gb+EM3UmWAGJCBPZ+zpseXGipqm9aYgZxqAYF
 NdK/gdQKQHgnEsIcENtcvGRQDuMSqPHmp13zU/Ewd/hLSAN2iVvYyZunC5QqEGrN7B6e
 mkR3seNRz/ZaeKsOH2/1X3Ec8SP/CsxeOO6E5t6S8ubd5Lq1bHVqxxywAHI0QjYE9dNi
 oVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756490362; x=1757095162;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uzdpvd9RhN3thFvxfLj8J0a3RKDZVl45M7XvZcko3Rc=;
 b=JAydQboTWBhaXO8VYxHek4KQH2mjFHnw7PYDiLy1B47w9S0qL682AcZTqooAqLBVPD
 8ek6L9idcSEWyXHi1SBoYpwLL4o1vI8Hl2/SiQuR8YAtK8AZm/E50LOTYCVshh5wTKIl
 ijHz3tYXoCefMjcfzVBSYJj7FL4XNdJmWeYk3lZ8DGPop9nMPGorxff2M2N/D59AG+t7
 aC+ktcMYRmJlTYMkxX5kBdct/ABl6zdjUuUYRysRT+9ClTsST5fguMEBZ0zf3Ti4+GFS
 V2vjAs6Qd7E4H+Ic6UoCdC2UXzX+pIZauF2r5dF12hfqy7tfMmWYFnG65qF2mZzyKg6v
 3OoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULxMkdcmFMOYD5CLZCS/J8OK0R4YTyDrZZZkRvDB0ZyMZgxmIagSyuJQemytb2IAg8VdkdS/je8itNs5umMPc=@lists.samba.org
X-Gm-Message-State: AOJu0YyIGDrT9bG/fhwubIEWUGPOaYxBS6g15+ij/py6x7Dml9tVwo5R
 UXvQ4l/3oByVBI+Q4aIGRAM5eyXWVCErlVEjnUxklmc4aLyb43WVTQx5gFnfcSJb7GtM1p8e8Ny
 fYdckp9MjUiXCg2N6tpaoB/yKBmixjgE=
X-Gm-Gg: ASbGncstBsZZUxg8Sg4Yyj9IlmClETjj9pgd/617dEmZvhK0j/O9Rf5CgqlvcQ9WrNd
 vpyql4rHfrGZMUiR81RuqGBbhzXK21Vpj3a1juGap8Lb/5j9auBS4As2obYLm0EI9q9pCqKhnHY
 08JzQEsHPk/qjwX6E++VCaRbdvfXs1pjXRYjop/S+u+y3AJZjTcvwVEJ/dz3Sv3+uzBHPkYBM2U
 ooezvQ4I+aFPSHik9As84irX96k/YXI3z4A93xlqZa/iBEcQ2M7a7lP6iEI3JZDUiPR3ncmMuLw
 DChHbYDL15Trm8qgmpacmwoSpcAWk+Lg
X-Google-Smtp-Source: AGHT+IHupljaA2Q6/3ptYRdDpiCwRMF2EccEDQec2Udsz7gkl1/EBD55KOjKvYqtezdT5Uz1t1vpvMWfGuF/vU/58VU=
X-Received: by 2002:a05:6214:4019:b0:70d:fcf7:8a17 with SMTP id
 6a1803df08f44-70dfcf78bd4mr60957996d6.51.1756490362217; Fri, 29 Aug 2025
 10:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <202508291432.M5gWPqJX-lkp@intel.com>
 <c18ba6b4-847e-4470-bd0e-9e5232add730@samba.org>
In-Reply-To: <c18ba6b4-847e-4470-bd0e-9e5232add730@samba.org>
Date: Fri, 29 Aug 2025 12:59:09 -0500
X-Gm-Features: Ac12FXzR6gFq22ImE-6fqvCCp5xnqd-ooH1SHmDHEHs_fLGA6dx45i5GlohPc6E
Message-ID: <CAH2r5mvksbiH-D4FbVb0PVg1vnik+WU7d0kxRUk0S9h9S+=zvw@mail.gmail.com>
Subject: Re: [cifs:for-next-next 28/146] fs/smb/client/smbdirect.c:1856:25:
 warning: stack frame size (1272) exceeds limit (1024) in 'smbd_get_connection'
To: Stefan Metzmacher <metze@samba.org>
Content-Type: multipart/mixed; boundary="00000000000017a9d7063d84c869"
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
Cc: linux-cifs@vger.kernel.org, kernel test robot <lkp@intel.com>,
 llvm@lists.linux.dev, samba-technical@lists.samba.org,
 oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--00000000000017a9d7063d84c869
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have updated the patch (see attached), and updated cifs-2.6.git for-next-=
next

>I'm not sure if the following should be added
> Reported-by: kernel test robot <lkp@intel.com>

That is a good question, but I lean against it since the "initial bug"
was not reported by them that caused the patch.  If it was a distinct
patch fixing the bug they pointed out, then yes it should be added,
but could be confusing if what they pointed out was totally unrelated
to the purpose of the patch.

On Fri, Aug 29, 2025 at 6:41=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Hi Steve,
>
> this is strange, but the following should fix the problem:
>
> --- a/fs/smb/common/smbdirect/smbdirect_socket.h
> +++ b/fs/smb/common/smbdirect/smbdirect_socket.h
> @@ -259,9 +259,11 @@ struct smbdirect_socket {
>
>   static __always_inline void smbdirect_socket_init(struct smbdirect_sock=
et *sc)
>   {
> -       *sc =3D (struct smbdirect_socket) {
> -               .status =3D SMBDIRECT_SOCKET_CREATED,
> -       };
> +       /*
> +        * This also sets status =3D SMBDIRECT_SOCKET_CREATED
> +        */
> +       BUILD_BUG_ON(SMBDIRECT_SOCKET_CREATED !=3D 0);
> +       memset(sc, 0, sizeof(*sc));
>
>          init_waitqueue_head(&sc->status_wait);
>
>
> It needs to be squashed into this commit:
> f2e2769275f4aa6e4d5fa98004301e91282a094a smb: smbdirect: introduce smbdir=
ect_socket_init()
>
> Can you do that?
>
> I'm not sure if the following should be added
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508291432.M5gWPqJX-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202508291615.Mxyg9D9N-lkp@i=
ntel.com/
>
> Thanks!
> metze
>
> Am 29.08.25 um 09:06 schrieb kernel test robot:
> > tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next-next
> > head:   b79712ce1752aa38da9553b06767f68367b0d7ff
> > commit: 36d70a0c8405556dea3d4e9beef708d7ed3c2b07 [28/146] smb: client: =
make use of smbdirect_socket_init()
> > config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/2=
0250829/202508291432.M5gWPqJX-lkp@intel.com/config)
> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 60=
09708b4367171ccdbf4b5905cb6a803753fe18)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250829/202508291432.M5gWPqJX-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202508291432.M5gWPqJX-l=
kp@intel.com/
>
>
> > All warnings (new ones prefixed by >>):
> >
> >>> fs/smb/client/smbdirect.c:1856:25: warning: stack frame size (1272) e=
xceeds limit (1024) in 'smbd_get_connection' [-Wframe-larger-than]
> >      1856 | struct smbd_connection *smbd_get_connection(
> >           |                         ^
> >     1 warning generated.
>
> >
> > vim +/smbd_get_connection +1856 fs/smb/client/smbdirect.c
> >
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1855
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17 @1856  struct sm=
bd_connection *smbd_get_connection(
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1857          s=
truct TCP_Server_Info *server, struct sockaddr *dstaddr)
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1858  {
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1859          s=
truct smbd_connection *ret;
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1860          i=
nt port =3D SMBD_PORT;
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1861
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1862  try_again=
:
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1863          r=
et =3D _smbd_get_connection(server, dstaddr, port);
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1864
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1865          /=
* Try SMB_PORT if SMBD_PORT doesn't work */
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1866          i=
f (!ret && port =3D=3D SMBD_PORT) {
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1867           =
       port =3D SMB_PORT;
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1868           =
       goto try_again;
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1869          }
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1870          r=
eturn ret;
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1871  }
> > f64b78fd1835d1d fs/cifs/smbdirect.c Long Li 2017-11-22  1872
> >
> > :::::: The code at line 1856 was first introduced by commit
> > :::::: 399f9539d951adf26a1078e38c1b0f10cf6c3e71 CIFS: SMBD: Implement f=
unction to create a SMB Direct connection
> >
> > :::::: TO: Long Li <longli@microsoft.com>
> > :::::: CC: Steve French <smfrench@gmail.com>
> >
>


--=20
Thanks,

Steve

--00000000000017a9d7063d84c869
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb-client-make-use-of-smbdirect_socket_init.patch"
Content-Disposition: attachment; 
	filename="0001-smb-client-make-use-of-smbdirect_socket_init.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mex4wcy70>
X-Attachment-Id: f_mex4wcy70

RnJvbSA0MTVlZTAzZGZmNDgxNjQ2MTFiNjg0MDM2YjQwNWI1MTMzMzdkZTc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGVmYW4gTWV0em1hY2hlciA8bWV0emVAc2FtYmEub3JnPgpE
YXRlOiBGcmksIDggQXVnIDIwMjUgMTU6MTA6NTIgKzAyMDAKU3ViamVjdDogW1BBVENIXSBzbWI6
IGNsaWVudDogbWFrZSB1c2Ugb2Ygc21iZGlyZWN0X3NvY2tldF9pbml0KCkKCkl0J3MgbXVjaCBz
YWZlciB0byBpbml0aWFsaXplIHRoZSB3aG9sZSBzdHJ1Y3R1cmUgYXQKdGhlIGJlZ2lubmluZyB0
aGFuIGRvaW5nIGl0IGFsbCBvdmVyIHRoZSBwbGFjZQphbmQgdGhlbiBtaXNzIHRvIG1vdmUgaXQg
aWYgY29kZSBjaGFuZ2VzLgoKQ2M6IFN0ZXZlIEZyZW5jaCA8c21mcmVuY2hAZ21haWwuY29tPgpD
YzogVG9tIFRhbHBleSA8dG9tQHRhbHBleS5jb20+CkNjOiBMb25nIExpIDxsb25nbGlAbWljcm9z
b2Z0LmNvbT4KQ2M6IGxpbnV4LWNpZnNAdmdlci5rZXJuZWwub3JnCkNjOiBzYW1iYS10ZWNobmlj
YWxAbGlzdHMuc2FtYmEub3JnClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBNZXR6bWFjaGVyIDxtZXR6
ZUBzYW1iYS5vcmc+ClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9z
b2Z0LmNvbT4KLS0tCiBmcy9zbWIvY2xpZW50L3NtYmRpcmVjdC5jICAgICAgICAgICAgICAgICAg
fCAxMyArLS0tLS0tLS0tLS0tCiBmcy9zbWIvY29tbW9uL3NtYmRpcmVjdC9zbWJkaXJlY3Rfc29j
a2V0LmggfCAgOCArKysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDE1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvc21iZGlyZWN0LmMgYi9m
cy9zbWIvY2xpZW50L3NtYmRpcmVjdC5jCmluZGV4IGI2N2EyNjRhNjAzMC4uZGVkOTEyZTkwNGYw
IDEwMDY0NAotLS0gYS9mcy9zbWIvY2xpZW50L3NtYmRpcmVjdC5jCisrKyBiL2ZzL3NtYi9jbGll
bnQvc21iZGlyZWN0LmMKQEAgLTEzNTEsMTMgKzEzNTEsNiBAQCBzdGF0aWMgaW50IGFsbG9jYXRl
X3JlY2VpdmVfYnVmZmVycyhzdHJ1Y3Qgc21iZF9jb25uZWN0aW9uICppbmZvLCBpbnQgbnVtX2J1
ZikKIAlzdHJ1Y3Qgc21iZGlyZWN0X3JlY3ZfaW8gKnJlc3BvbnNlOwogCWludCBpOwogCi0JSU5J
VF9MSVNUX0hFQUQoJnNjLT5yZWN2X2lvLnJlYXNzZW1ibHkubGlzdCk7Ci0Jc3Bpbl9sb2NrX2lu
aXQoJnNjLT5yZWN2X2lvLnJlYXNzZW1ibHkubG9jayk7Ci0Jc2MtPnJlY3ZfaW8ucmVhc3NlbWJs
eS5kYXRhX2xlbmd0aCA9IDA7Ci0Jc2MtPnJlY3ZfaW8ucmVhc3NlbWJseS5xdWV1ZV9sZW5ndGgg
PSAwOwotCi0JSU5JVF9MSVNUX0hFQUQoJnNjLT5yZWN2X2lvLmZyZWUubGlzdCk7Ci0Jc3Bpbl9s
b2NrX2luaXQoJnNjLT5yZWN2X2lvLmZyZWUubG9jayk7CiAJaW5mby0+Y291bnRfcmVjZWl2ZV9x
dWV1ZSA9IDA7CiAKIAlpbml0X3dhaXRxdWV1ZV9oZWFkKCZpbmZvLT53YWl0X3JlY2VpdmVfcXVl
dWVzKTsKQEAgLTE2NTYsMTQgKzE2NDksMTIgQEAgc3RhdGljIHN0cnVjdCBzbWJkX2Nvbm5lY3Rp
b24gKl9zbWJkX2dldF9jb25uZWN0aW9uKAogCWlmICghaW5mbykKIAkJcmV0dXJuIE5VTEw7CiAJ
c2MgPSAmaW5mby0+c29ja2V0OworCXNtYmRpcmVjdF9zb2NrZXRfaW5pdChzYyk7CiAJc3AgPSAm
c2MtPnBhcmFtZXRlcnM7CiAKIAlpbmZvLT5pbml0aWF0b3JfZGVwdGggPSAxOwogCWluZm8tPnJl
c3BvbmRlcl9yZXNvdXJjZXMgPSBTTUJEX0NNX1JFU1BPTkRFUl9SRVNPVVJDRVM7CiAKLQlpbml0
X3dhaXRxdWV1ZV9oZWFkKCZzYy0+c3RhdHVzX3dhaXQpOwotCi0Jc2MtPnN0YXR1cyA9IFNNQkRJ
UkVDVF9TT0NLRVRfQ1JFQVRFRDsKIAlyYyA9IHNtYmRfaWFfb3BlbihpbmZvLCBkc3RhZGRyLCBw
b3J0KTsKIAlpZiAocmMpIHsKIAkJbG9nX3JkbWFfZXZlbnQoSU5GTywgInNtYmRfaWFfb3BlbiBy
Yz0lZFxuIiwgcmMpOwpAQCAtMTc3Myw4ICsxNzY0LDYgQEAgc3RhdGljIHN0cnVjdCBzbWJkX2Nv
bm5lY3Rpb24gKl9zbWJkX2dldF9jb25uZWN0aW9uKAogCWxvZ19yZG1hX2V2ZW50KElORk8sICJj
b25uZWN0aW5nIHRvIElQICVwSTQgcG9ydCAlZFxuIiwKIAkJJmFkZHJfaW4tPnNpbl9hZGRyLCBw
b3J0KTsKIAotCWluaXRfd2FpdHF1ZXVlX2hlYWQoJnNjLT5yZWN2X2lvLnJlYXNzZW1ibHkud2Fp
dF9xdWV1ZSk7Ci0KIAlXQVJOX09OX09OQ0Uoc2MtPnN0YXR1cyAhPSBTTUJESVJFQ1RfU09DS0VU
X1JETUFfQ09OTkVDVF9ORUVERUQpOwogCXNjLT5zdGF0dXMgPSBTTUJESVJFQ1RfU09DS0VUX1JE
TUFfQ09OTkVDVF9SVU5OSU5HOwogCXJjID0gcmRtYV9jb25uZWN0KHNjLT5yZG1hLmNtX2lkLCAm
Y29ubl9wYXJhbSk7CmRpZmYgLS1naXQgYS9mcy9zbWIvY29tbW9uL3NtYmRpcmVjdC9zbWJkaXJl
Y3Rfc29ja2V0LmggYi9mcy9zbWIvY29tbW9uL3NtYmRpcmVjdC9zbWJkaXJlY3Rfc29ja2V0LmgK
aW5kZXggNjRhYmU2OTMyZmVmLi5jNjJkMTJmNjNlMTMgMTAwNjQ0Ci0tLSBhL2ZzL3NtYi9jb21t
b24vc21iZGlyZWN0L3NtYmRpcmVjdF9zb2NrZXQuaAorKysgYi9mcy9zbWIvY29tbW9uL3NtYmRp
cmVjdC9zbWJkaXJlY3Rfc29ja2V0LmgKQEAgLTI1OSw5ICsyNTksMTEgQEAgc3RydWN0IHNtYmRp
cmVjdF9zb2NrZXQgewogCiBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgc21iZGlyZWN0X3Nv
Y2tldF9pbml0KHN0cnVjdCBzbWJkaXJlY3Rfc29ja2V0ICpzYykKIHsKLQkqc2MgPSAoc3RydWN0
IHNtYmRpcmVjdF9zb2NrZXQpIHsKLQkJLnN0YXR1cyA9IFNNQkRJUkVDVF9TT0NLRVRfQ1JFQVRF
RCwKLQl9OworCS8qCisJICogVGhpcyBhbHNvIHNldHMgc3RhdHVzID0gU01CRElSRUNUX1NPQ0tF
VF9DUkVBVEVECisJICovCisJQlVJTERfQlVHX09OKFNNQkRJUkVDVF9TT0NLRVRfQ1JFQVRFRCAh
PSAwKTsKKwltZW1zZXQoc2MsIDAsIHNpemVvZigqc2MpKTsKIAogCWluaXRfd2FpdHF1ZXVlX2hl
YWQoJnNjLT5zdGF0dXNfd2FpdCk7CiAKLS0gCjIuNDguMQoK
--00000000000017a9d7063d84c869--

