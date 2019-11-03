Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C421AED130
	for <lists+samba-technical@lfdr.de>; Sun,  3 Nov 2019 01:04:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=hxQ/7TbZpqRG276CQelGV2q8exzmtzEgZPyTSgGgwj8=; b=lPWSGLyE/WI+C35yRcsjW5YwZf
	MjJ53LyQL+qMAKhhjMpTWGacWuJStj/V/1MUWgeSyl/4tXElJ5zPzcL+99nGei+7Utwj5QdsqX2N7
	j4l36PkbFj0nML03UMQnSZzYocGMEQQIDuO3ZtM/gAW4eqVn/LSFqwJE645qEZMypfksNdolwH2YN
	hx+Ld2qjekOAbicqVjiJe2DB/nvqG+Gky12h7UTRoAzhfLlVH1I7ZuCfC13j3XM61P85KUfFfoiQv
	mhJ581ZCq8alKuLEK211gkOk2jFHK21sZUENxcwP/ATz3Sfu1rEGqZ152Pceu5v8a5QI7c3cCQRpn
	ol8AtV/A==;
Received: from localhost ([::1]:28802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iR3N4-0068fW-Rt; Sun, 03 Nov 2019 00:03:54 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:50506) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iR3Mz-0068fP-1R
 for samba-technical@lists.samba.org; Sun, 03 Nov 2019 00:03:52 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id CEAF7D1EBC6FF;
 Sun,  3 Nov 2019 03:03:45 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PN16rOrSWrrJ; Sun,  3 Nov 2019 03:03:44 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id D0DB3D1EBC707;
 Sun,  3 Nov 2019 03:03:44 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru D0DB3D1EBC707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1572739424;
 bh=hxQ/7TbZpqRG276CQelGV2q8exzmtzEgZPyTSgGgwj8=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=iRiaEzcupjLbJzy6uQ6zoe9Ud13IBAyN6vzhbzrBlDIEhGirzDMST2LjN14OLmfD/
 5LKDBArv3WU/IHhgmLhKy/Zfn79ue3aYjp8NQhgU+gIP9XL/Re8M82Ul8c3occbn84
 FtfZOmahYvX39iD256mmEsuc9mUTPoAd1GHB04pPNo8xPY9HoczTQlozXYG2p0cIbi
 jTdqMyM4sgBrXHgij2czJub8Y5kPTM3X6EYWyuXiFRVbdccR6xiJgiOa5RG/S3Fjx8
 3LUdzP2RsuV5diJA9F95M1KkeBrIf514QLXXXzW+MUBoPTPnrCUyXzM6/gjz2VB8eI
 QHt1lwMdDt4AQ==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id uX1rLVs3hUMh; Sun,  3 Nov 2019 03:03:44 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-71-208.ip.moscow.rt.ru
 [90.154.71.208])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 98F01D1EBC6FF;
 Sun,  3 Nov 2019 03:03:44 +0300 (MSK)
Subject: Re: Automating usage of smbspool_krb5_wrapper
To: Andreas Schneider <asn@samba.org>
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <1853953.WXbCIQQCWo@magrathea>
 <f21e078f-669f-6590-c0a1-f450f72200be@rosalinux.ru>
 <18291618.dcJLbluVCs@magrathea>
Message-ID: <7e571555-5d87-a566-dbf1-4a1c33c67ea8@rosalinux.ru>
Date: Sun, 3 Nov 2019 03:03:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <18291618.dcJLbluVCs@magrathea>
Content-Type: multipart/mixed; boundary="------------E7B1B9A379B03B360CED1717"
Content-Language: ru-RU
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
From: Mikhail Novosyolov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------E7B1B9A379B03B360CED1717
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

29.10.2019 10:29, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Monday, 28 October 2019 20:38:08 CET Mikhail Novosyolov wrote:
>> 28.10.2019 11:47, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On Monday, 28 October 2019 08:58:26 CET Mikhail Novosyolov via
>>> samba-technical>
>>> wrote:
>>>> 28.10.2019 10:44, Mikhail Novosyolov =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> <...>
>>>>> There are 2 possible solutions:
>>>>>
>>>>> 1) either patch source3/client/smbspool_krb5_wrapper.c to "goto
>>>>> smbspool;" if env does not contain "negotiate" instead of chekcing =
to
>>>>> be either null or 0 - how correct will this be?
>>>> I mean this:
>>>>
>>>> diff --git a/source3/client/smbspool_krb5_wrapper.c
>>>> b/source3/client/smbspool_krb5_wrapper.c
>>>> index bff1df417e8..000a613291e 100644
>>>> --- a/source3/client/smbspool_krb5_wrapper.c
>>>> +++ b/source3/client/smbspool_krb5_wrapper.c
>>>> @@ -149,7 +149,7 @@ int main(int argc, char *argv[])
>>>>
>>>>            env =3D getenv("AUTH_INFO_REQUIRED");
>>>>           =20
>>>>             /* If not set, then just call smbspool. */
>>>>
>>>> -       if (env =3D=3D NULL || env[0] =3D=3D 0) {
>>>> +       if (env =3D=3D NULL || env =3D=3D "none" || env[0] =3D=3D 0)=
 {
>>>>
>>>>                    CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED is not set - "
>>>>                   =20
>>>>                                   "execute smbspool");
>>>>                   =20
>>>>                    goto smbspool;
>>> This is obviously wrong :-)
>>>
>>> Did you see the code below? The question is if we should map
>>>
>>> AUTH_INFO_REQUIRED=3Dnone
>>>
>>> to anonymous. I've created a patchset you can find here:
>>>
>>> https://git.samba.org/?p=3Dasn/samba.git;a=3Dshortlog;h=3Drefs/heads/=
master-smbs
>>> pool
>>>
>>>
>>> However you need to try all combinations, username/password, kerberos=
 and
>>> none for anonymous.
>> Thank you! I did not test these patches yet, first tried to understand
>> how it works.
>>
>> Could you please explain a bit how it works?
> That's a good question as documentation from CUPS side is missing. So w=
e need
> to find out what CUPS does and then try to write tests for it if possib=
le.
> This allows us to make sure we work correctly. The repo above shows you=
 where
> the test is in the samba source code. I've tried to add more tests in t=
he past
> to avoid regressions and verify we work correctly. This needs to be ext=
ended
> as much as possible.
>
>
> The two patches were just a quick shot.

CUPS developer has clearified documentation:

  * https://github.com/apple/cups/issues/5674
  * https://github.com/apple/cups/commit/025b8ce8f637009f0df7a5bb5fa0a460=
dbb32b10

"'negotiate': Kerberos is required - this keyword can only appear by=20
itself and causes cupsd to collect the UID of the printing user."

I've switched smbspool_krb5_wrapper from failing if value of=20
AUTH_INFO_REQUIRED is something not known to just ignoring that and=20
passing the task to smbspool. smbspool will fail itself. Added a test=20
for that. Patches on top of asn/samba.git/master-smbspool are attached.

I've not tested those changes yet, just checked buildability. Testing=20
will require making a complex set up, I will try.


--------------E7B1B9A379B03B360CED1717
Content-Type: text/x-patch;
 name="0003-s3-smbspool_krb5_wrapper-ignore-unknown-values-of-AU.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0003-s3-smbspool_krb5_wrapper-ignore-unknown-values-of-AU.pa";
 filename*1="tch"

From b2581f0ecc1253fa4d805b962ac8c7191f92e278 Mon Sep 17 00:00:00 2001
From: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Date: Sun, 3 Nov 2019 01:28:13 +0300
Subject: [PATCH 3/4] s3:smbspool_krb5_wrapper: ignore unknown values of
 AUTH_INFO_REQUIRED

To make smbspool_krb5_wrapper usable as a default destination for symlink
/usr/lib/cups/backend/smb in Linux ditros, it has to be well-prepared
for any possible values of AUTH_INFO_REQUIRED set by cupsd and correctly
pass printing tasks to smbspool if it sees that Kerberos authentication
is not needed.

Discussed here: https://lists.samba.org/archive/samba-technical/2019-October/134470.html

Signed-off-by: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
---
 source3/client/smbspool_krb5_wrapper.c | 34 ++++++++++++++++++++------
 source3/script/tests/test_smbspool.sh  | 28 +++++++++++++++++++++
 2 files changed, 55 insertions(+), 7 deletions(-)

diff --git a/source3/client/smbspool_krb5_wrapper.c b/source3/client/smbspool_krb5_wrapper.c
index bd6319ca9c3..a2851d7fbc1 100644
--- a/source3/client/smbspool_krb5_wrapper.c
+++ b/source3/client/smbspool_krb5_wrapper.c
@@ -145,36 +145,56 @@ int main(int argc, char *argv[])
 		snprintf(device_uri, sizeof(device_uri), "%s", env);
 	}
 
-	/* Check if AuthInfoRequired is set to negotiate */
+	/* We must handle the following values of AUTH_INFO_REQUIRED:
+	 *  none: Anonymous/guest printing
+	 *  username,password: A username (of the form "username" or "DOMAIN\username")
+	 *                     and password are required
+	 *  negotiate: Kerberos authentication
+	 *  NULL (not set): will never happen when called from cupsd
+	 * https://www.cups.org/doc/spec-ipp.html#auth-info-required
+	 * https://github.com/apple/cups/issues/5674
+	 */
 	env = getenv("AUTH_INFO_REQUIRED");
 
         /* If not set, then just call smbspool. */
 	if (env == NULL || env == "none" || env[0] == 0) {
 		CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED is not set - "
-			       "execute smbspool");
+			       "executing smbspool");
+		/* Pass this printing task to smbspool without Kerberos auth */
 		goto smbspool;
 	} else {
 		CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED=%s", env);
 
+		/* First test the value of AUTH_INFO_REQUIRED
+		 * against known possible values
+		 */
 		cmp = strcmp(env, "none");
 		if (cmp == 0) {
 			CUPS_SMB_DEBUG("Authenticate using none (anonymous) - "
-				       "execute smbspool");
+				       "executing smbspool");
 			goto smbspool;
 		}
 
 		cmp = strcmp(env, "username,password");
 		if (cmp == 0) {
 			CUPS_SMB_DEBUG("Authenticate using username/password - "
-				       "execute smbspool");
+				       "executing smbspool");
 			goto smbspool;
 		}
 
+		/* Now, if 'goto smbspool' still has not happened,
+		 * there are only two variants left:
+		 * 1) AUTH_INFO_REQUIRED is "negotiate" and then
+		 *    we have to continue working
+		 * 2) or it is something not known to us, then Kerberos
+		 *    authentication is not required, so just also pass
+		 *    this task to smbspool
+		 */
 		cmp = strcmp(env, "negotiate");
 		if (cmp != 0) {
-			CUPS_SMB_ERROR("Authentication unsupported");
-			fprintf(stderr, "ATTR: auth-info-required=negotiate\n");
-			return CUPS_BACKEND_AUTH_REQUIRED;
+			CUPS_SMB_DEBUG("Value of AUTH_INFO_REQUIRED is not known "
+				       "to smbspool_krb5_wrapper, executing smbspool");
+			goto smbspool;
 		}
 
 		snprintf(auth_info_required,
diff --git a/source3/script/tests/test_smbspool.sh b/source3/script/tests/test_smbspool.sh
index 01d72101615..c32ace6682e 100755
--- a/source3/script/tests/test_smbspool.sh
+++ b/source3/script/tests/test_smbspool.sh
@@ -66,6 +66,30 @@ test_smbspool_authinforequired_none()
 	return 0
 }
 
+test_smbspool_authinforequired_unknown()
+{
+	cmd='$samba_smbspool_krb5 smb://$SERVER_IP/print4 200 $USERNAME "Testprint" 1 "options" $SRCDIR/testdata/printing/example.ps 2>&1'
+
+	# smbspool_krb5_wrapper must ignore AUTH_INFO_REQUIRED unknown to him and pass the task to smbspool
+	# smbspool must fail with NT_STATUS_ACCESS_DENIED (22)
+	# "jjf4wgmsbc0" is just a random string
+	AUTH_INFO_REQUIRED="jjf4wgmsbc0"
+	export AUTH_INFO_REQUIRED
+	eval echo "$cmd"
+	out=$(eval $cmd)
+	ret=$?
+	unset AUTH_INFO_REQUIRED
+
+	case "$ret" in
+		22 ) return 0 ;;
+		* )
+			echo "$out"
+			echo "failed to test $smbspool_krb5 against unknown value of AUTH_INFO_REQUIRED"
+			return 1
+		;;
+	esac
+}
+
 #
 # The test enviornment uses 'vlp' (virtual lp) as the printing backend.
 #
@@ -187,6 +211,10 @@ testit "smbspool_krb5_wrapper AuthInfoRequired=none" \
 	test_smbspool_authinforequired_none || \
 	failed=$(expr $failed + 1)
 
+testit "smbspool_krb5_wrapper AuthInfoRequired=(sth unknown)" \
+	test_smbspool_authinforequired_unknown || \
+	failed=$(expr $failed + 1)
+
 testit "smbspool print example.ps" \
 	$samba_smbspool smb://$USERNAME:$PASSWORD@$SERVER_IP/print1 200 $USERNAME "Testprint" 1 "options" $SRCDIR/testdata/printing/example.ps || \
 	failed=$(expr $failed + 1)
-- 
2.20.1


--------------E7B1B9A379B03B360CED1717
Content-Type: text/x-patch;
 name="0004-smbspool-print-a-hint-about-smbspool_krb5_wrapper.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0004-smbspool-print-a-hint-about-smbspool_krb5_wrapper.patch"

From 90dec7767aa6aecd303164eaea22656b9fa4e959 Mon Sep 17 00:00:00 2001
From: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Date: Sun, 3 Nov 2019 01:47:51 +0300
Subject: [PATCH 4/4] smbspool: print a hint about smbspool_krb5_wrapper

When I first met with the situation that Kerberos kredentials cache of root
user was looked for instead of the one of the printing task creator,
it took a lot of time to understand that smbspool_krb5_wrapper will resolve this.

Signed-off-by: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
---
 source3/client/smbspool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/source3/client/smbspool.c b/source3/client/smbspool.c
index 34def0c91a9..5e2d230ab8b 100644
--- a/source3/client/smbspool.c
+++ b/source3/client/smbspool.c
@@ -699,8 +699,8 @@ smb_connect(struct cli_state **output_cli,
 	if (strcmp(auth_info_required, "negotiate") == 0) {
 		if (!kerberos_ccache_is_valid()) {
 			fprintf(stderr,
-				"ERROR: No valid Kerberos credential cache "
-				"found!\n");
+				"ERROR: No valid Kerberos credential cache found! "
+				"Using smbspool_krb5_wrapper may help.\n");
 			return NT_STATUS_LOGON_FAILURE;
 		}
 		user = jobusername;
-- 
2.20.1


--------------E7B1B9A379B03B360CED1717--

