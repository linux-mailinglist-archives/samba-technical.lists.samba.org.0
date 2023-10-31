Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D72CD7DD4D5
	for <lists+samba-technical@lfdr.de>; Tue, 31 Oct 2023 18:43:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=EbTQgXcvBOPRm7wdUoXlPy6yzkXWw6zaeZh5YAaznm4=; b=w5hvn1HpD31kLFQwaqWxQFTupS
	hqgeQTKqSTYT2E+u3nymgEuuonlNfA6R2RyUGifi+Ta2Z7Iplu4FFjH/ZHR0wHJLoVb34H7PGcodM
	aaZ9Nnbw6p/UUBCNWLJ6DoHkqKoohZEbMn7zNMkqqi5Tdqt1wN7T+GEbO7J9Si+qPBt5JLnCUGED7
	+tuXoc5YueYg8pP/X2zkrTWwttRdkA+jA0cq9zGcfVHHFDKzI3Dc6C45FoyECI8iwv7ulNnLAwvEw
	uqex2lh/YW/sPlp8VrQoz4NdQDhBFfPk9Xkp7Rt8ZVqT7mCBezEe2g0y7ZB3u4KIN21mD+qOlEDB0
	y+zt0VBQ==;
Received: from ip6-localhost ([::1]:44026 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxsm2-003ijF-Nd; Tue, 31 Oct 2023 17:43:30 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:57702) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qxslw-003ij4-J6
 for samba-technical@lists.samba.org; Tue, 31 Oct 2023 17:43:28 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-66fbcc70c94so24031446d6.3
 for <samba-technical@lists.samba.org>; Tue, 31 Oct 2023 10:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698774199; x=1699378999; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=h2AT3TlivnOdnN/TRcm/I7xMw2jgDbVXsx8GbYOP6Ko=;
 b=LcTUMB7aEg+k44nnu9bE2Q/Y0ta9vBGulAfssbf+pj99r8DKDHbBfhJFmW41bHcSck
 rYXDI+fVUE5H+eGA78z+L++e0ws0OjxZNUUgh4jDw6oT9clTo0+Ww6qRwUMHuvR6iHwr
 ujiwQukLP6EX0OxQCBUI5gar/3kZGnS04fqLS4L9A8zbVbEsGWB4hz+HO9JPue3WWYsr
 +ZZIFifJVFfdVCXGQV97FCQBD+86MlCk8RMwMLdzCasbWpRiY5lukNRwUhpVVEEw52i8
 ioDv0FTUaHJCsxmSLJTGc4W6CFiKtWeNHo1b46kqU9dzpGQHcNCOcCWHfVtvWSFNxhTG
 DrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698774199; x=1699378999;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h2AT3TlivnOdnN/TRcm/I7xMw2jgDbVXsx8GbYOP6Ko=;
 b=QuXkSkdAe70PtS0JyslbOUuAjsSgZUMULwhZ7lyF3qwBlwLS6BLWnJm+/K69H52YTG
 yRlqfGzcfCmmtHTPQqGkI9fhzkYcaYBcura5mC79mpdQvs/TCNnl5El+cGHgjvOSNwRx
 L0RCVuC8hvWpk1IPi2eK6mgLyS+Zabt1HANji+GLM6Zl35TEWHzbDgC+gQDUrJx5KTcw
 Xz2M6uDUfK8FSifnvN58mV8yzBBjcDIv40OAfqljdvyrHivds9rfycG6iQ85H99X2lym
 WW1kFKyw0H281NE2vyLMnc6vfktYmvr657rWkUjnEd5SJPuaGs2NvGJ2y9uKaUzic1TG
 GA0g==
X-Gm-Message-State: AOJu0YyLUfdyivR9+zA1RRAcLr4ZuuwbIq6HUqTN4YFpfuQhSadANrj+
 sLPQowiNs+Cl56rbwZJb/QdQDzwlvV2evkc6DF7y01FiGw8=
X-Google-Smtp-Source: AGHT+IE/J2wQsnqNA0SiBux37/DMR9LyMbmUj93WQW0u/H0KQ/OpHWrAJqfEAl+dVTqk6FY2rRisvIyPMGvmQya9ApU=
X-Received: by 2002:ad4:5961:0:b0:656:51b9:990e with SMTP id
 eq1-20020ad45961000000b0065651b9990emr16281299qvb.57.1698774198718; Tue, 31
 Oct 2023 10:43:18 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 31 Oct 2023 10:39:57 -0700
Message-ID: <CACyXjPy58-1pAQ1cOHhGa0M_8XSfpOU-G1HAMwjB6sMj673OEA@mail.gmail.com>
Subject: How else can I pass params into an smbtorture test?
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

I have written an smbtorture test to check Windows Previous versions
behavior.

I used environment variables to pass in the file on the share to access. Is
there a way to do this via normal smbtorture parameters?

The following code tries to do what Windows does when accessing previous
versions:

 /*
+ * Test the GET_SHADOW_COPY code. This tests the performance and checks if
+ * there are duplicate labels and that we can open the files referred to.
+ */
+#define GMT_FMT "@GMT-%Y.%m.%d-%H.%M.%S"
+
+static bool test_get_shadow_copy_1(struct torture_context *tctx,
+                                  struct smb2_tree *tree)
+{
+       bool ret =3D true;
+       char *file_name =3D getenv("TORTURE_PDFS_WPV_FILE");
+       NTSTATUS status;
+       struct smb2_handle h;
+       struct smb2_create first;
+       union smb_ioctl ioctl;
+       uint32_t num_labels =3D 0;
+       uint32_t num_returned =3D 0;
+       const uint8_t *gmt_str;
+       int i;
+       NTTIME *version_ctimes =3D NULL;
+
+       if (file_name =3D=3D NULL) {
+               file_name =3D "torture_pdfs_wpv_file.txt";
+       }
+
+       ZERO_STRUCT(first);
+       first.in.fname              =3D file_name;
+       first.in.desired_access     =3D SEC_FILE_READ_DATA;
+       first.in.create_disposition =3D NTCREATEX_DISP_OPEN_IF;
+       first.in.file_attributes    =3D 0;
+       first.in.share_access       =3D NTCREATEX_SHARE_ACCESS_READ |
+                                     NTCREATEX_SHARE_ACCESS_WRITE;
+       first.in.create_options     =3D 0;
+
+       status =3D smb2_create(tree, tctx, &first);
+       torture_assert_ntstatus_ok(tctx, status,
+                                  talloc_asprintf(tctx, "Opening file %s "
+                                                        "failed (%s)\n",
+                                                        file_name,
+
 nt_errstr(status)));
+       h =3D first.out.file.handle;
+
+       ZERO_STRUCT(ioctl);
+
+       /* First, get the number of snaps */
+       ioctl.smb2.level =3D RAW_IOCTL_SMB2;
+       ioctl.smb2.in.file.handle =3D h;
+       ioctl.smb2.in.function =3D FSCTL_SRV_ENUM_SNAPS;
+       ioctl.smb2.in.max_response_size =3D 16;
+       ioctl.smb2.in.flags =3D SMB2_IOCTL_FLAG_IS_FSCTL;
+
+       status =3D smb2_ioctl(tree, tree, &ioctl.smb2);
+       torture_assert_ntstatus_ok(tctx, status,
+                                  "GET_SHADOW_DATA for #labels failed\n");
+
+       dump_data(1, (const uint8_t *)ioctl.smb2.out.out.data, 16);
+
+       /* Ask again with the right size this time */
+       num_labels =3D *(uint32_t *)ioctl.smb2.out.out.data;
+
+       ioctl.smb2.in.max_response_size =3D 16 + (num_labels * 50);
+
+       status =3D smb2_ioctl(tree, tree, &ioctl.smb2);
+       torture_assert_ntstatus_ok(tctx, status,
+                                  "GET_SHADOW_DATA for the labels
failed\n");
+
+       dump_data(1, (const uint8_t *)ioctl.smb2.out.out.data,
+                    16 + (num_labels * 50));
+
+       num_returned =3D ((uint32_t *)ioctl.smb2.out.out.data)[1];
+
+       torture_assert(tctx, (num_labels =3D=3D num_returned),
+                      talloc_asprintf(tctx,
+                                      "num_labels (%u) !=3D
num_returned(%u)\n",
+                                      num_labels, num_returned));
+
+       gmt_str =3D &((const uint8_t *)ioctl.smb2.out.out.data)[12];
+
+       version_ctimes =3D talloc_array(tctx, NTTIME, num_returned);
+       torture_assert(tctx, (version_ctimes !=3D NULL),
+                      "Unable to allocate space for version_ctimes");
+
+       for (i =3D 0; i < num_returned; i++) {
+               char *str, *match;
+               bool converted =3D false;
+               size_t converted_size =3D 0;
+               struct tm tm;
+               struct timeval timeval;
+               NTTIME nttime;
+               struct smb2_create io;
+
+               converted =3D convert_string_talloc(tctx, CH_UTF16LE, CH_UN=
IX,
+                                                 gmt_str, 50,
+                                                 &str, &converted_size);
+               torture_assert(tctx, (converted =3D=3D true),
+                              talloc_asprintf(tctx,
+                                              "Failed to convert label
%d\n",
+                                              i));
+
+               DEBUG(1, ("Label %i is \"%s\"\n", i, str));
+
+               match =3D strptime(str, GMT_FMT, &tm);
+               torture_assert(tctx, (*match =3D=3D 0),
+                                     "Failed to convert label to time\n");
+
+               timeval.tv_sec =3D mktime(&tm);
+               timeval.tv_usec =3D 0;
+
+               nttime =3D timeval_to_nttime(&timeval);
+
+               ZERO_STRUCT(io);
+               io.in.desired_access         =3D SEC_FILE_READ_DATA;
+               io.in.file_attributes        =3D FILE_ATTRIBUTE_NORMAL;
+               io.in.create_disposition     =3D NTCREATEX_DISP_OPEN_IF;
+               io.in.share_access           =3D NTCREATEX_SHARE_ACCESS_REA=
D |
+                                              NTCREATEX_SHARE_ACCESS_WRITE=
;
+               io.in.timewarp               =3D nttime;
+
+                io.in.fname =3D file_name;
+
+               status =3D smb2_create(tree, tctx, &io);
+               CHECK_STATUS(status, NT_STATUS_OK);
+
+               torture_assert(tctx,
+                              (first.out.change_time !=3D
io.out.change_time),
+                              talloc_asprintf(tctx, "change_time for
version "
+                                              "%i same as original file\n"=
,
+                                              i));
+
+               version_ctimes[i] =3D io.out.change_time;
+
+               gmt_str +=3D 50;
+       }
+
+       /* We don't need to do all these comparisons ... */
+       for (i =3D 0; i < num_returned; i++) {
+               int j;
+
+               for (j =3D 0; j < num_returned; j++) {
+                       if (i !=3D j) {
+                               torture_assert(tctx, (version_ctimes[i] !=
=3D
+                                                     version_ctimes[j]),
+                                              talloc_asprintf(tctx,
+                                                              "ctime[%d]
=3D=3D "
+
 "ctime[%d]\n", i,
+                                                              j));
+                       }
+               }
+       }
+
+       return ret;
+}

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)
