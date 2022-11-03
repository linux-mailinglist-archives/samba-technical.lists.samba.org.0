Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7790B617759
	for <lists+samba-technical@lfdr.de>; Thu,  3 Nov 2022 08:12:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=5ioYIG3VBFVqTjFBaCTf8dM5J7hSwAiY55eP0/9o++8=; b=uauZRk7GRUSREMp7109vEUvRAb
	OR4RD6OGlZ3h2va7Qlzgf2PuLSDZ47Sg/dtzXo7l9zF5Aof/N8AloqOc1Dpyfo6WauvQ6Mg0CNEbJ
	5ToUCTK0EHHbYMiEOhGVnJaUb22sA+58TcS/WzfGu7bOHN68QeXpTmWWHavY0PYe3fndjXpieMfoa
	wOBbx4RnpW6X8Y6PaTsFYm06NqCybG1uVN/fCFkcc1MBmMyJ+w5HfRxcmcx8V45N6sGy02ZwoRIgB
	3fvCh9RJmuE0B7uFwxcJpVgpqd55dEx5fzETO+zN4EGQmpWc8FyGMqw3a79/FAsjAvDKG/B4k2R0Z
	PH8u9hpg==;
Received: from ip6-localhost ([::1]:53912 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oqUNm-00AEpP-WD; Thu, 03 Nov 2022 07:11:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31934) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oqUNU-00AEpG-Nf
 for samba-technical@lists.samba.org; Thu, 03 Nov 2022 07:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=5ioYIG3VBFVqTjFBaCTf8dM5J7hSwAiY55eP0/9o++8=; b=woOmV/CVmtEfFv3LNkmc9/LUWo
 ijgJQNEG/Ae19Kv9Yz4DRsCxfFW9hxeRv7g9ni96xCNzN0SsFRKsrYZw6hTPp45zOp9KHqHpc/4M0
 YrkzbsxXsY1iQdOFjd4gkj88WNpKi4vc4TEf3g4ZzSVrZTbNfkERweij4e1tg9RjK0HdDhlymqG3z
 0C8w/3mpS7NXcENCDq0gmCFSiQWBGtcLvr5LDQbMHmhCkhISD2j0+X+UFQOOTBxSt8ukhl9vDSgv8
 g9ovTBsRF6NLTpohrxdunOOXSwYbdnsRe1PYkESibsxW7WiS/CjVpO5oWJ5BeK8NATgLYarMB/q3m
 8Y6K6qPT16trTSWIL5MtlIoHCnFZ6IolDKSJTDXVsD6eQJ320Hec6643WeTkzjVe6rXyS111GnfIT
 X53ms2oKG9sIb6UkCzq2vzRR0TCgNsQi9cn/KR1wX6kgqe7o3j7aciB69cvPMGS1ON+DWPrhRpLmV
 1bz5Y4Bzkeo9KP23uVB0obJS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oqUNS-0071j0-Lq; Thu, 03 Nov 2022 07:11:03 +0000
To: jra@samba.org
Subject: Re: [SCM] Samba Shared Repository - smbclient rate limit
Date: Thu, 03 Nov 2022 08:11:01 +0100
Message-ID: <12090652.O9o76ZdvQC@magrathea>
In-Reply-To: <E1oqMWf-005wfA-O3@hrx0.samba.org>
References: <E1oqMWf-005wfA-O3@hrx0.samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 2 November 2022 23:48:01 CET Jeremy Allison wrote:
> The branch, master has been updated
>        via  b3292b541ec smbget: Adds a rate limiting option --limit-rate in
> KB/s from  bf446bcf612 third_party/heimdal_build: Update fallthrough macro
> for switch statements
> 
> https://git.samba.org/?p=samba.git;a=shortlog;h=master
> 
> 
> - Log -----------------------------------------------------------------
> commit b3292b541ec1feb3162a514a0493054a1a5318ab
> Author: vporpo <v.porpodas@gmail.com>
> Date:   Sat Oct 1 14:45:18 2022 -0700
> 
>     smbget: Adds a rate limiting option --limit-rate in KB/s
> 
>     This patch implements a very simple rate limiter. It works by pausing
> the main download loop whenever the bytes transferred are more than what we
> would get with if it were transferred at the rate set by the user.
>     Please note that this may reduce the blocksize if the limit is too
> small.
> 
>     Signed-off-by: Vasileios Porpodas <v.porpodas@gmail.com>
>     Reviewed-by: Jeremy Allison <jra@samba.org>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
> 
>     Autobuild-User(master): Jeremy Allison <jra@samba.org>
>     Autobuild-Date(master): Wed Nov  2 22:47:10 UTC 2022 on sn-devel-184
> 
> -----------------------------------------------------------------------
> 
> Summary of changes:
>  docs-xml/manpages/smbget.1.xml      |  6 +++
>  source3/script/tests/test_smbget.sh | 30 +++++++++++++++
>  source3/utils/smbget.c              | 73
> +++++++++++++++++++++++++++++++++++++ 3 files changed, 109 insertions(+)
> 
> 
> Changeset truncated at 500 lines:
> 
> diff --git a/docs-xml/manpages/smbget.1.xml b/docs-xml/manpages/smbget.1.xml
> index 64924ef9ca8..9d1db967f96 100644
> --- a/docs-xml/manpages/smbget.1.xml
> +++ b/docs-xml/manpages/smbget.1.xml
> @@ -35,6 +35,7 @@
>  		<arg choice="opt">-O, --stdout</arg>
>  		<arg choice="opt">-u, --update</arg>
>  		<arg choice="opt">-e, --encrypt</arg>
> +		<arg choice="opt">--limit-rate=INT</arg>
>  		<arg choice="opt">-?, --help</arg>
>  		<arg choice="opt">--usage</arg>
>  		<arg choice="req">smb://host/share/path/to/file</arg>
> @@ -151,6 +152,11 @@
>  		<listitem><para>Enable SMB encryption.</para></listitem>
>  	</varlistentry>
> 
> +	<varlistentry>
> +        <term>--limit-rate=INT</term>
> +		<listitem><para>Limit download rate by this many KB/s.</
para></listitem>
> +	</varlistentry>
> +
>  </refsect1>
> 
>  <refsect1>
> diff --git a/source3/script/tests/test_smbget.sh
> b/source3/script/tests/test_smbget.sh index c1c99579a8c..2322f3af942 100755
> --- a/source3/script/tests/test_smbget.sh
> +++ b/source3/script/tests/test_smbget.sh
> @@ -269,6 +269,32 @@ test_msdfs_link()
>  	return 0
>  }
> 
> +# Tests --limit-rate. Getting the testfile (128K in size) with --limit-rate
> 100 +# (that is 100KB/s) should take at least 1 sec to complete.
> +test_limit_rate()
> +{
> +	clear_download_area
> +	echo "$SMBGET -v -a --limit-rate 100 smb://$SERVER_IP/smbget/
testfile"
> +	time_begin=$(date +%s)
> +	$SMBGET -v -a --limit-rate 100 smb://$SERVER_IP/smbget/testfile
> +	if [ $? -ne 0 ]; then
> +		echo 'ERROR: RC does not match, expected: 0'
> +		return 1
> +	fi
> +	time_end=$(date +%s)
> +	cmp --silent $WORKDIR/testfile ./testfile
> +	if [ $? -ne 0 ]; then
> +		echo 'ERROR: file content does not match'
> +		return 1
> +	fi
> +	if [ $((time_end - time_begin)) -lt 1 ]; then
> +		echo 'ERROR: It should take at least 1s to transfer 128KB 
with rate
> 100KB/s' +		return 1
> +	fi
> +	return 0
> +}
> +
> +
>  create_test_data
> 
>  pushd $TMPDIR
> @@ -306,6 +332,10 @@ testit "update" test_update ||
> 
>  testit "msdfs" test_msdfs_link ||
>  	failed=$((failed + 1))
> +
> +testit "limit rate" test_limit_rate ||
> +	failed=$((failed + 1))
> +
>  clear_download_area
> 
>  popd # TMPDIR
> diff --git a/source3/utils/smbget.c b/source3/utils/smbget.c
> index 3e7c5687d83..5f3ac16b204 100644
> --- a/source3/utils/smbget.c
> +++ b/source3/utils/smbget.c
> @@ -56,6 +56,7 @@ struct opt {
>  	bool send_stdout;
>  	bool update;
>  	int debuglevel;
> +	unsigned limit_rate;
>  };
>  static struct opt opt = { .blocksize = SMB_DEFAULT_BLOCKSIZE };
> 
> @@ -355,6 +356,10 @@ static bool smb_download_file(const char *base, const
> char *name, off_t offset_download = 0, offset_check = 0, curpos = 0,
>  	      start_offset = 0;
>  	struct stat localstat, remotestat;
> +	clock_t start_of_bucket_ticks = 0;
> +	size_t bytes_in_bucket = 0;
> +	size_t bucket_size = 0;
> +	clock_t ticks_to_fill_bucket = 0;
> 
>  	snprintf(path, SMB_MAXPATHLEN-1, "%s%s%s", base,
>  		 (*base && *name && name[0] != '/' &&
> @@ -576,6 +581,44 @@ static bool smb_download_file(const char *base, const
> char *name, offset_check = 0;
>  	}
> 
> +	/* We implement rate limiting by filling up a bucket with bytes and
> +	 * checking, once the bucket is filled, if it was filled too fast.
> +	 * If so, we sleep for some time to get an average transfer rate that
> +	 * equals to the one set by the user.
> +	 *
> +	 * The bucket size directly affects the traffic characteristics.
> +	 * The smaller the bucket the more frequent the pause/resume cycle.
> +	 * A large bucket can result in burst of high speed traffic and large
> +	 * pauses. A cycle of 100ms looks like a good value. This value (in
> +	 * ticks) is held in `ticks_to_fill_bucket`. The `bucket_size` is
> +	 * calculated as:
> +	 * `limit_rate * 1024 * / (CLOCKS_PER_SEC / ticks_to_fill_bucket)`
> +	 *
> +	 * After selecting the bucket size we also need to check the 
blocksize
> +	 * of the transfer, since this is the minimum unit of traffic that we
> +	 * can observe. Achieving a ~10% precision requires a blocksize with 
a
> +	 * maximum size of `bucket_size / 10`.
> +	 */
> +	if (opt.limit_rate > 0) {
> +		unsigned max_block_size;
> +		/* This is the time that the bucket should take to fill. */
> +		ticks_to_fill_bucket = 100 /*ms*/ * CLOCKS_PER_SEC / 1000;
> +		/* This is the size of the bucket in bytes.
> +		 * If we fill the bucket too quickly we should pause */
> +		bucket_size = opt.limit_rate * 1024 / (CLOCKS_PER_SEC /
> ticks_to_fill_bucket); +		max_block_size = bucket_size / 10;
> +		max_block_size = max_block_size > 0 ? max_block_size : 1;
> +		if (opt.blocksize > max_block_size) {
> +			if (opt.blocksize != SMB_DEFAULT_BLOCKSIZE) {
> +				fprintf(stderr,
> +				        "Warning: Overriding block size to 
%d \
> +				         due to limit-rate", 
max_block_size);
> +			}
> +			opt.blocksize = max_block_size;
> +		}
> +		start_of_bucket_ticks = clock();
> +	}
> +
>  	readbuf = (char *)SMB_MALLOC(opt.blocksize);
>  	if (!readbuf) {
>  		fprintf(stderr, "Failed to allocate %zu bytes for read "
> @@ -592,7 +635,30 @@ static bool smb_download_file(const char *base, const
> char *name, ssize_t bytesread;
>  		ssize_t byteswritten;
> 
> +		/* Rate limiting. This pauses the transfer to limit traffic. 
*/
> +		if (opt.limit_rate > 0) {
> +			if (bytes_in_bucket > bucket_size) {
> +				clock_t now_ticks = clock();
> +				clock_t diff_ticks = now_ticks
> +				                     - 
start_of_bucket_ticks;
> +				/* Check if the bucket filled up too fast. 
*/
> +				if (diff_ticks < ticks_to_fill_bucket) {
> +					/* Pause until 
`ticks_to_fill_bucket` */
> +					double sleep_us
> +					 = (ticks_to_fill_bucket - 
diff_ticks)
> +					  * 1000000 / CLOCKS_PER_SEC;
> +					usleep(sleep_us);
> +				}
> +				/* Reset the byte counter and the ticks. 
*/
> +				bytes_in_bucket = 0;
> +				start_of_bucket_ticks = clock();
> +			}
> +		}
> +
>  		bytesread = smbc_read(remotehandle, readbuf, opt.blocksize);
> +		if (opt.limit_rate > 0) {
> +			bytes_in_bucket += bytesread;
> +		}
>  		if(bytesread < 0) {
>  			fprintf(stderr,
>  				"Can't read %zu bytes at offset %jd, file 
%s\n",
> @@ -902,6 +968,13 @@ int main(int argc, char **argv)
>  			.val        = 'f',
>  			.descrip    = "Use specified rc file"
>  		},
> +		{
> +			.longName   = "limit-rate",
> +			.argInfo    = POPT_ARG_INT,
> +			.arg        = &opt.limit_rate,
> +			.val        = 'l',

This should use an enum OPT_LIMIT_RATE instead of 'l' or it will confilict 
with common options!


	Andreas

> +			.descrip    = "Limit download speed to this many 
KB/s"
> +		},
> 
>  		POPT_TABLEEND
>  	};


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



